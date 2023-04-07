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
        preferredSize: Size(double.infinity, SizeManager.s60),
        child: AccountPageAppBar(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column().animate().fadeIn(duration: 500.ms),
        ),
      ),
    );
  }
}
