import 'package:fitnessio/presentation/resources/assets_manager.dart';
import 'package:flutter/material.dart';

class MainStartingPage extends StatefulWidget {
  const MainStartingPage({super.key});

  @override
  State<MainStartingPage> createState() => _MainStartingPageState();
}

class _MainStartingPageState extends State<MainStartingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(ImageManager.backgroundMan),
          ),
        ),
      ),
    );
  }
}
