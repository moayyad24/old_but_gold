import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:old_but_gold/core/theme/app_colors.dart';
import 'package:old_but_gold/core/theme/app_text_styles.dart';
import 'package:old_but_gold/i18n/strings.g.dart';

class RememberMeCheckbox extends StatefulWidget {
  final ValueChanged<bool>? onChanged;
  final bool initialValue;

  const RememberMeCheckbox({
    super.key,
    this.onChanged,
    this.initialValue = false,
  });

  @override
  State<RememberMeCheckbox> createState() => _RememberMeCheckboxState();
}

class _RememberMeCheckboxState extends State<RememberMeCheckbox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(end: 8.w),
            child: SizedBox(
              width: 18.w,
              height: 18.h,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
                side: BorderSide(width: 1),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                  widget.onChanged?.call(_isChecked);
                },
                activeColor: Theme.of(context).primaryColor,
                fillColor: WidgetStateProperty.resolveWith<Color>((
                  Set<WidgetState> states,
                ) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.blue0D87F9;
                  }
                  return AppColors.whiteFFFFFF;
                }),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
              widget.onChanged?.call(_isChecked);
            },
            child: Text(
              t.auth.agreePrivacyTermsAndPolitics,
              style: AppTextStyles.medium14,
            ),
          ),
        ],
      ),
    );
  }
}
