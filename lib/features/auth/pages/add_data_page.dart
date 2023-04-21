import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/auth/providers/auth_provider.dart';
import 'package:smart_home_app/features/auth/widgets/add_data_widgets.dart';
import 'package:smart_home_app/utils/router/router.dart';
import 'package:smart_home_app/utils/widgets/text_field_widget.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/font_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/widgets/lime_green_rounded_button.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  String? _valueGender;
  String? _valueActivity;
  void _onChangedGender(Object? selectedGenderValue) {
    if (selectedGenderValue is String) {
      setState(() {
        _valueGender = selectedGenderValue;
      });
    }
  }

  void _onChangedActivity(Object? selectedActivityValue) {
    if (selectedActivityValue is String) {
      setState(() {
        _valueActivity = selectedActivityValue;
      });
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final email = Provider.of<AuthProvider>(context).user!.email;
    Future addUserData() async {
      try {
        await authProvider.addUserData(
          email: email!,
          name: _nameController.text,
          surname: _surnameController.text,
          age: int.parse(_ageController.text),
          context: context,
          gender: _valueGender!,
          height: double.parse(_heightController.text),
          weight: double.parse(_weightController.text),
          activity: _valueActivity!,
        );
      } catch (e) {
        print(e);
      }
    }

    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      appBar: AppBar(
        backgroundColor: ColorManager.darkGrey,
        elevation: SizeManager.s0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: PaddingManager.p28),
                child: Center(
                  child: Text(
                    StringsManager.enterData,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: FontSize.s20,
                      fontWeight: FontWightManager.semiBold,
                      color: ColorManager.white,
                    ),
                  ),
                ),
              ),
              AddDataWidgets(
                ageController: _ageController,
                heightController: _heightController,
                weightController: _weightController,
                onChangedGender: _onChangedGender,
                valueGender: _valueGender,
                valueActivity: _valueActivity,
                onChangedActivity: _onChangedActivity,
                nameController: _nameController,
                surnameController: _surnameController,
              ),
              LimeGreenRoundedButtonWidget(
                onTap: () {
                  addUserData().then((value) => Navigator.of(context)
                      .pushReplacementNamed(Routes.mainRoute));
                },
                title: StringsManager.procede,
              )
            ],
          ),
        ),
      ),
    );
  }
}
