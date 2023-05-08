import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class ExerciseWidget extends StatelessWidget {
  const ExerciseWidget({
    super.key,
    required this.name,
    required this.repNumber,
    required this.setNumber,
    required this.onDeleted,
    required this.onFinished,
    required this.id,
  });

  final String name;
  final int setNumber;
  final int repNumber;
  final Function(BuildContext)? onDeleted;
  final Function(BuildContext)? onFinished;
  final String id;

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(
        top: PaddingManager.p8,
        left: PaddingManager.p1,
        right: PaddingManager.p1,
      ),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onFinished,
              icon: Icons.done_all_sharp,
              label: StringsManager.finished,
              foregroundColor: ColorManager.darkGrey,
              backgroundColor: ColorManager.limerGreen2,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDeleted,
              icon: Icons.delete,
              label: StringsManager.delete,
              foregroundColor: ColorManager.limerGreen2,
              backgroundColor: ColorManager.darkGrey,
            ),
          ],
        ),
        child: Container(
          width: deviceWidth,
          height: SizeManager.s110.h,
          decoration: BoxDecoration(
            color: ColorManager.black87,
            border: Border(
              bottom: BorderSide(
                color: ColorManager.limerGreen2,
                width: SizeManager.s1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: PaddingManager.p2,
              right: PaddingManager.p2,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        name,
                        style: StyleManager.exerciseNameTextStyle,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${setNumber.round()}',
                                style: StyleManager
                                    .exerciseRepAndSetNumberTextStyle,
                              ),
                              SizedBox(
                                width: SizeManager.s3.w,
                              ),
                              Text(
                                StringsManager.setNumberHint,
                                style:
                                    StyleManager.exerciseRepAndSetHintTextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: SizeManager.s10.h,
                          ),
                          Row(
                            children: [
                              Text(
                                '${repNumber.round()}',
                                style: StyleManager
                                    .exerciseRepAndSetNumberTextStyle,
                              ),
                              SizedBox(
                                width: SizeManager.s3.w,
                              ),
                              Text(
                                StringsManager.repNumberHint,
                                style:
                                    StyleManager.exerciseRepAndSetHintTextStyle,
                              ),
                            ],
                          ),
                        ],
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
