import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';

class WeightNumberColumnWidget extends StatelessWidget {
  const WeightNumberColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '120',
          style: StyleManager.weightProfTextSTyle,
        ),
        Text(
          '100',
          style: StyleManager.weightProfTextSTyle,
        ),
        Text(
          '80',
          style: StyleManager.weightProfTextSTyle,
        ),
        Text(
          '60',
          style: StyleManager.weightProfTextSTyle,
        ),
        Text(
          '40',
          style: StyleManager.weightProfTextSTyle,
        ),
        Text(
          '20',
          style: StyleManager.weightProfTextSTyle,
        ),
        Text(
          '0',
          style: StyleManager.weightProfTextSTyle,
        ),
      ],
    );
  }
}
