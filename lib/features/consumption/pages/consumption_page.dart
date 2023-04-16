import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: PaddingManager.p28,
                left: PaddingManager.p12,
                right: PaddingManager.p12,
                bottom: PaddingManager.p12,
              ),
              child: Container(
                width: deviceWidth,
                height: SizeManager.s100,
                decoration: BoxDecoration(
                  color: ColorManager.black87,
                  borderRadius: BorderRadius.circular(
                    RadiusManager.r40,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
