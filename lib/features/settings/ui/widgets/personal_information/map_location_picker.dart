import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  @override
  void initState() {
    super.initState();
    _initLocation();
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
      final enabled = await Geolocator.openLocationSettings();
      if (enabled) {
        setState(() => _locationState = LocationState.loading);
        await _initLocation();
      }
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

  void _confirmAddress() {
    if (_selectedPosition != null) {
      //ToDo: implement this
      print('${_selectedPosition!.latitude}, ${_selectedPosition!.longitude}');
      // Navigator.pop(context, _selectedPosition);
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
          cameraTargetBounds: CameraTargetBounds(
            LatLngBounds(
              northeast: const LatLng(
                37.3,
                42.4,
              ), // Northwest Syria (near Turkey border)
              southwest: const LatLng(
                32.3,
                35.6,
              ), // Southeast Syria (near Jordan border)
            ),
          ),
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
              onPressed: _confirmAddress,
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
            Icon(Icons.location_off, size: 60.w, color: Colors.red),
            SizedBox(height: 24.h),
            Text(
              _errorMessage ?? 'Location error',
              style: AppTextStyles.medium16.copyWith(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _initLocation,
                  child: const Text('Retry'),
                ),
                SizedBox(width: 16.w),
                if (_locationState == LocationState.permissionDenied)
                  ElevatedButton(
                    onPressed: _openAppSettings,
                    child: const Text('Open Settings'),
                  )
                else if (_locationState == LocationState.serviceDisabled)
                  ElevatedButton(
                    onPressed: _enableLocationServices,
                    child: const Text('Enable Location'),
                  ),
              ],
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
