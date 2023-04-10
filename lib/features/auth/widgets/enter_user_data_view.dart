import 'package:flutter/material.dart';
import 'package:smart_home_app/features/auth/widgets/text_form_field_auth.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';

class EnterUserDataView extends StatelessWidget {
  const EnterUserDataView({
    Key? key,
    required this.nameController,
    required this.surnameController,
    required this.ageController,
  }) : super(key: key);

  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController ageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextFormFieldWidget(
          width: SizeManager.s400,
          controller: nameController,
          labelHint: StringsManager.nameHint,
          obscureText: false,
        ),
        TextFormFieldWidget(
          width: SizeManager.s400,
          controller: surnameController,
          labelHint: StringsManager.surnameHint,
          obscureText: false,
        ),
        TextFormFieldWidget(
          width: SizeManager.s400,
          controller: ageController,
          labelHint: StringsManager.ageHint,
          obscureText: false,
        )
      ],
    );
  }
}
