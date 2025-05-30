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
          TextSpan(text: t.auth.you_can_check_out_our),
          TextSpan(
            text: t.auth.terms_of_service,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: t.auth.and_also),
          TextSpan(
            text: t.auth.privacy_policy,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.w500,
              color: Colors.blue,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
          TextSpan(text: t.auth.for_more_details),
        ],
      ),
    );
  }
}
