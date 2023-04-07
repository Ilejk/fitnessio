import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/account/providers/account_provider.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class AccountPageAppBar extends StatelessWidget {
  const AccountPageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accountProvider =
        Provider.of<AccountProvider>(context, listen: false);
    return AppBar(
      title: const Text(
        StringsManager.myAcc,
        style: StyleManager.myAccTitleTextStyle,
      ),
      elevation: SizeManager.s0,
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: PaddingManager.p12),
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
                accountProvider.signOut(context: context);
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.logout_sharp,
                size: SizeManager.s26,
                color: ColorManager.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
