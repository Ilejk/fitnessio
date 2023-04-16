import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class NewMealPage extends StatefulWidget {
  const NewMealPage({super.key});

  @override
  State<NewMealPage> createState() => _NewMealPageState();
}

class _NewMealPageState extends State<NewMealPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(
          deviceWidth,
          SizeManager.s60,
        ),
        child: AppBar(
          elevation: 0.0,
          title: const Text(
            StringsManager.addMealABtitle,
            style: StyleManager.abTitleTextStyle,
          ),
          backgroundColor: ColorManager.darkGrey,
          leading: Padding(
            padding: const EdgeInsets.only(left: PaddingManager.p12),
            child: Container(
              height: SizeManager.s40,
              width: SizeManager.s40,
              decoration: BoxDecoration(
                color: ColorManager.grey3,
                borderRadius: BorderRadius.circular(
                  RadiusManager.r40,
                ),
              ),
              child: IconButton(
                splashColor: ColorManager.grey3,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: SizeManager.s26,
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
