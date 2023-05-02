import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class EditTextButton extends StatelessWidget {
  const EditTextButton({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p3,
        right: PaddingManager.p12,
        bottom: PaddingManager.p12,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringsManager.edit,
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: ColorManager.white,
                  fontSize: FontSize.s16.sp,
                  fontWeight: FontWightManager.regular,
                  letterSpacing: SizeManager.s1,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                width: SizeManager.s3.w,
              ),
              const Icon(
                Icons.edit,
                color: ColorManager.white,
                size: SizeManager.s18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
