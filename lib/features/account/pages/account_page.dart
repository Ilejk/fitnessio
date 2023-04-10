import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:smart_home_app/features/account/widgets/appbar_account.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: const PreferredSize(
        preferredSize: Size(
          double.infinity,
          SizeManager.s60,
        ),
        child: AccountPageAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: PaddingManager.p28,
                    left: PaddingManager.p28,
                    right: PaddingManager.p28,
                  ),
                  child: Container(
                    width: SizeManager.s400,
                    height: SizeManager.s250,
                    decoration: BoxDecoration(
                      color: ColorManager.limerGreen2,
                      borderRadius: BorderRadius.circular(
                        RadiusManager.r15,
                      ),
                    ),
                  ),
                ),
              ],
            ).animate().fadeIn(
                  duration: 500.ms,
                ),
          ),
        ),
      ),
    );
  }
}
