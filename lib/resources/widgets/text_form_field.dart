import 'package:flutter/material.dart';
import 'package:smart_home_app/resources/color_manager.dart';
import 'package:smart_home_app/resources/font_manager.dart';
import 'package:smart_home_app/resources/value_manager.dart';
import 'package:smart_home_app/resources/widgets/neu_dark_container_widget.dart';

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key? key,
    required this.controller,
    required this.labelHint,
    required this.obscureText,
    required this.width,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final String labelHint;
  final double width;

  @override
  Widget build(BuildContext context) {
    return NeuButton(
      width: width,
      height: SizeManager.s70,
      radius: RadiusManager.r15,
      child: Padding(
        padding: const EdgeInsets.all(PaddingManager.p8),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          textAlign: TextAlign.start,
          style: const TextStyle(color: ColorManager.limeGreen),
          autocorrect: false,
          keyboardType: TextInputType.emailAddress,
          cursorColor: ColorManager.limeGreen,
          decoration: InputDecoration(
            labelText: labelHint,
            labelStyle: const TextStyle(
              color: ColorManager.limeGreen,
              fontSize: FontSize.s14,
              letterSpacing: SizeManager.s1_5,
              fontWeight: FontWightManager.semiBold,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
