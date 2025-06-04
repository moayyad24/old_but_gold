import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class TermsAndPrivacyText extends StatelessWidget {
  const TermsAndPrivacyText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          fontFamily: 'Tajawal',
          fontWeight: FontWeight.w500,
          fontSize: 15.sp,
          color: Colors.grey[600],
        ),
        children: [
          TextSpan(text: t.auth.youCanCheckOutOur),
          TextSpan(
            text: t.auth.termsOfService,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: t.auth.andAlso),
          TextSpan(
            text: t.auth.privacyPolicy,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: t.auth.forMoreDetails),
        ],
      ),
    );
  }
}
