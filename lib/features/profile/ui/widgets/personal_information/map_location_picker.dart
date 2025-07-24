import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:old_but_gold/core/constants/db_keys.dart';
import 'package:old_but_gold/core/helper/dependency_injection.dart';
import 'package:old_but_gold/core/helper/shared_preference.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/core/widgets/app_confirm_button.dart';
import 'package:old_but_gold/core/widgets/drag_handle.dart';
import 'package:old_but_gold/features/auth/ui/widgets/auth_app_bar.dart';
import 'package:old_but_gold/features/auth/ui/widgets/custom_stepper.dart';

class MapLocationPicker extends StatefulWidget {
  const MapLocationPicker({super.key});

  @override
  State<MapLocationPicker> createState() => MapLocationPickerState();
}

class MapLocationPickerState extends State<MapLocationPicker> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _currentPosition;
  LatLng? _selectedPosition;
  bool _isMapMoving = false;
  LocationState _locationState = LocationState.loading;
  String? _errorMessage;
  bool _buttonLoading = false;
  late LocalStorageService storage;

  @override
  void initState() {
    super.initState();
    _initLocation();
    storage = getIt.get<LocalStorageService>();
  }

  Future<void> _initLocation() async {
    try {
      // Check location service status
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _locationState = LocationState.serviceDisabled);
        return;
      }

      // Check and request permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _locationState = LocationState.permissionDenied);
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        setState(() => _locationState = LocationState.permissionDenied);
        return;
      }

      // Get current position
      final position = await Geolocator.getCurrentPosition().timeout(
        const Duration(seconds: 15),
        onTimeout: () => throw TimeoutException('Location request timed out'),
      );

      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
        _selectedPosition = _currentPosition;
        _locationState = LocationState.loaded;
      });

      // Move camera after a slight delay
      Future.delayed(const Duration(milliseconds: 300), () {
        if (_currentPosition != null) _moveCamera(_currentPosition!);
      });
    } catch (e) {
      setState(() {
        _locationState = LocationState.error;
        _errorMessage = _getErrorMessage(e);
      });
    }
  }

  String _getErrorMessage(dynamic error) {
    if (error is TimeoutException) return 'Location request timed out';
    if (error is PermissionDeniedException) return 'Location permission denied';
    if (error is LocationServiceDisabledException) {
      return 'Location services are disabled';
    }
    return 'Failed to get location: ${error.toString()}';
  }

  Future<void> _moveCamera(LatLng position) async {
    try {
      final controller = await _controller.future;
      await controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: position, zoom: 16),
        ),
      );
    } catch (e) {
      // Ignore camera move errors
    }
  }

  Future<void> _enableLocationServices() async {
    try {
      await Geolocator.openLocationSettings();
      // Check every second for 20 seconds
      const interval = Duration(seconds: 1);
      const timeout = Duration(seconds: 20);
      final timer = Timer.periodic(interval, (timer) async {
        final enabled = await Geolocator.isLocationServiceEnabled();
        if (enabled) {
          timer.cancel();
          if (mounted) {
            setState(() => _locationState = LocationState.loading);
            await _initLocation();
          }
        }
      });
      // Cancel timer after timeout
      Future.delayed(timeout, () {
        if (timer.isActive) {
          timer.cancel();
          if (mounted) {
            setState(() {
              _locationState = LocationState.error;
              _errorMessage = 'Location services not enabled';
            });
          }
        }
      });
    } catch (e) {
      setState(() {
        _locationState = LocationState.error;
        _errorMessage = 'Failed to open location settings';
      });
    }
  }

  Future<void> _openAppSettings() async {
    try {
      await Geolocator.openAppSettings();
      setState(() => _locationState = LocationState.loading);
      await _initLocation();
    } catch (e) {
      setState(() {
        _locationState = LocationState.error;
        _errorMessage = 'Failed to open app settings';
      });
    }
  }

  Future<String?> _getAddressFromAPI(double lat, double lng) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://nominatim.openstreetmap.org/reverse',
        queryParameters: {'format': 'json', 'lat': lat, 'lon': lng},
      );

      if (response.statusCode == 200) {
        final data = response.data;
        return "${data['address']['city']}, ${data['address']['country']}";
      }
      return "Error occurred, Please reselect your location";
    } on DioException catch (e) {
      debugPrint('Error fetching address: ${e.message}');
      return null;
    }
  }

  void _confirmAddress(String? countryCity) async {
    if (_selectedPosition != null) {
      Navigator.pop(context, countryCity);
    }
  }

  Future<void> _onCameraMove(CameraPosition position) async {
    if (!_isMapMoving) {
      setState(() => _isMapMoving = true);
    }
  }

  Future<void> _onCameraIdle() async {
    if (!_isMapMoving) return;

    try {
      final controller = await _controller.future;
      final visibleRegion = await controller.getVisibleRegion();
      final center = LatLng(
        (visibleRegion.northeast.latitude + visibleRegion.southwest.latitude) /
            2,
        (visibleRegion.northeast.longitude +
                visibleRegion.southwest.longitude) /
            2,
      );

      setState(() {
        _selectedPosition = center;
        _isMapMoving = false;
      });
    } catch (e) {
      setState(() => _isMapMoving = false);
    }
  }

  Future<void> _storeLatLong(double lat, double long) async {
    await storage.setString(DbKeys.latitude, lat.toString());
    await storage.setString(DbKeys.longitude, long.toString());
  }

  Widget _buildMapContent() {
    return Stack(
      children: [
        GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(
            target: _currentPosition ?? const LatLng(0, 0),
            zoom: 16,
          ),
          onMapCreated: (controller) => _controller.complete(controller),
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          onCameraMove: _onCameraMove,
          onCameraIdle: _onCameraIdle,
          zoomControlsEnabled: false,
        ),
        Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child:
                _isMapMoving
                    ? Icon(
                      Icons.location_on_rounded,
                      key: UniqueKey(),
                      size: 55,
                      color: AppColors.darkBlue02314C,
                    )
                    : Icon(
                      Icons.location_on_rounded,
                      key: UniqueKey(),
                      size: 60,
                      color: AppColors.green006A6F,
                    ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [AppColors.black.withAlpha(130), Colors.transparent],
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 40.h, horizontal: 24.w),
            child: AppConfirmButton(
              text: 'Confirm your location',
              isLoading: _buttonLoading,
              onPressed: () async {
                setState(() {
                  _buttonLoading = true;
                });
                await _storeLatLong(
                  _selectedPosition!.latitude,
                  _selectedPosition!.longitude,
                );
                String? countryCity = await _getAddressFromAPI(
                  _selectedPosition!.latitude,
                  _selectedPosition!.longitude,
                );
                _confirmAddress(countryCity);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/icons/warning.svg'),
            SizedBox(height: 24.h),
            Text(
              _errorMessage ?? 'Please enable your location',
              style: AppTextStyles.semiBold20,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            if (_locationState == LocationState.permissionDenied)
              ElevatedButton(
                onPressed: _openAppSettings,
                child: const Text('Open Settings'),
              )
            else if (_locationState == LocationState.serviceDisabled)
              AppConfirmButton(
                text: 'Enable Location',
                onPressed: () async {
                  await _enableLocationServices();
                },
              ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AuthAppBar(
            dots: [DotState.completed, DotState.completed, DotState.current],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 25.h),
              decoration: BoxDecoration(
                color: AppColors.whiteFFFDF2,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(34),
                ),
                border: Border.all(
                  color: AppColors.darkGrey666666.withAlpha(100),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.darkGrey666666.withAlpha(100),
                    blurRadius: 10,
                    spreadRadius: 0,
                    offset: const Offset(0, -1),
                  ),
                ],
              ),
              child:
                  _locationState == LocationState.loading
                      ? const Center(child: CircularProgressIndicator())
                      : Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: DragHandle(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 32.h),
                            child: Text(
                              'Pick Your Location',
                              style: AppTextStyles.bold26,
                            ),
                          ),
                          Expanded(
                            child:
                                _locationState == LocationState.loaded
                                    ? _buildMapContent()
                                    : _buildErrorState(),
                          ),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }
}

enum LocationState { loading, loaded, serviceDisabled, permissionDenied, error }
