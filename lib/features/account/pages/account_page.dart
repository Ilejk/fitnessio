import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/account/providers/account_provider.dart';
import 'package:smart_home_app/features/account/widgets/appbar_account.dart';
import 'package:smart_home_app/features/account/widgets/button_account.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  void signOut(AccountProvider accountProvider, BuildContext context) {
    accountProvider.signOut(context: context);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);
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
                  ),
                  child: Container(
                    width: deviceWidth,
                    height: SizeManager.s250,
                    decoration: BoxDecoration(
                      color: ColorManager.grey3,
                      borderRadius: BorderRadius.circular(
                        RadiusManager.r15,
                      ),
                    ),
                  ),
                ),
                AccountPageButton(
                  deviceWidth: deviceWidth,
                  onTap: () {
                    //TODO:
                  },
                  iconData: Icons.email_outlined,
                  title: StringsManager.changeEmail,
                ),
                AccountPageButton(
                  deviceWidth: deviceWidth,
                  onTap: () {
                    //TODO:
                  },
                  iconData: Icons.lock_open_sharp,
                  title: StringsManager.changePassword,
                ),
                AccountPageButton(
                  deviceWidth: deviceWidth,
                  onTap: () => signOut(accountProvider, context),
                  iconData: Icons.logout_sharp,
                  title: StringsManager.signOut,
                )
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
