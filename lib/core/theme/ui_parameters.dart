import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const double _defaultHorizontalPadding = 24;
const double _defaultTopPadding = 50;

class UiParameters {
  ///Default App Padding TLR
  static EdgeInsets get dPadding =>
      EdgeInsets.only(
        top: _defaultTopPadding,
        left: _defaultHorizontalPadding,
        right: _defaultHorizontalPadding,
      ).r;

  ///Horizontal App Padding LR
  static EdgeInsets get hPadding =>
      EdgeInsets.symmetric(horizontal: _defaultHorizontalPadding).r;
}
