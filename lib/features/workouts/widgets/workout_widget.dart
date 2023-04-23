import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class WorkoutWidget extends StatelessWidget {
  const WorkoutWidget({
    super.key,
    required this.name,
    required this.repNumber,
    required this.setNumber,
    required this.onPressed,
    required this.id,
  });

  final String name;
  final int setNumber;
  final int repNumber;
  final Function(BuildContext)? onPressed;
  final String id;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p28,
        left: PaddingManager.p12,
        right: PaddingManager.p12,
        bottom: PaddingManager.p12,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(RadiusManager.r40),
              onPressed: onPressed,
              icon: Icons.delete,
              label: StringsManager.delete,
              foregroundColor: ColorManager.limerGreen2,
              backgroundColor: ColorManager.darkGrey,
            ),
          ],
        ),
        child: Container(
          width: deviceWidth,
          height: SizeManager.s200,
          decoration: BoxDecoration(
            color: ColorManager.black87,
            borderRadius: BorderRadius.circular(
              RadiusManager.r40,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: PaddingManager.p12,
              right: PaddingManager.p12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: PaddingManager.p28,
                    left: PaddingManager.p28,
                    bottom: PaddingManager.p12,
                    right: PaddingManager.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingManager.p12,
                        ),
                        child: Icon(
                          Icons.done_all_rounded,
                          color: ColorManager.limerGreen2,
                        ),
                      ),
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: FontSize.s22,
                          color: ColorManager.white,
                          fontWeight: FontWightManager.semiBold,
                          letterSpacing: SizeManager.s1,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '🔥${setNumber.round()}',
                        style: const TextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.white2,
                          fontWeight: FontWightManager.regular,
                          letterSpacing: SizeManager.s1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: PaddingManager.p12,
                          right: PaddingManager.p12,
                        ),
                        child: Container(
                          width: SizeManager.s10,
                          height: SizeManager.s3,
                          decoration: BoxDecoration(
                            color: ColorManager.limerGreen2,
                            borderRadius: BorderRadius.circular(
                              RadiusManager.r100,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        '${repNumber.round()}',
                        style: const TextStyle(
                          fontSize: FontSize.s16,
                          color: ColorManager.white2,
                          fontWeight: FontWightManager.regular,
                          letterSpacing: SizeManager.s1,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
