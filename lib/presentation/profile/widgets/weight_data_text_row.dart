import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class WeightDataTextRowWidget extends StatelessWidget {
  const WeightDataTextRowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p12,
        right: PaddingManager.p12,
        left: PaddingManager.p12,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: SizeManager.s35.h,
            width: SizeManager.s35.w,
            child: Image.asset(
              ImageManager.weightIc,
              color: ColorManager.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: PaddingManager.p12),
            child: Text(
              'Wight Data',
              style: TextStyle(
                color: ColorManager.white,
                fontSize: FontSize.s18.sp,
                fontWeight: FontWightManager.bold,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Text(
            '91',
            style: TextStyle(
              color: ColorManager.limerGreen2,
              fontSize: FontSize.s20.sp,
              fontWeight: FontWightManager.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: PaddingManager.p3),
            child: Text(
              'kg',
              style: TextStyle(
                color: ColorManager.white,
                fontSize: FontSize.s18.sp,
                fontWeight: FontWightManager.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
