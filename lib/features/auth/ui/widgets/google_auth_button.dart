import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';

class GoogleAuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const GoogleAuthButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.whiteFFFFFF,
          foregroundColor: AppColors.black,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          side: BorderSide(color: AppColors.greyC2C2C2, width: 1.0),
          elevation: 0,
        ),
        child:
            isLoading
                ? const CircularProgressIndicator(
                  color: Colors.blue, // Google blue color
                  strokeWidth: 2,
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/google.svg', // Your Google icon path
                      width: 24,
                      height: 24,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      'Continue with Google',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
