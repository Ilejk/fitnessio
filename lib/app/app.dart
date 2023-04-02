import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/auth/auth_provider.dart';
import 'package:smart_home_app/features/auth/login/login_provider.dart';
import 'package:smart_home_app/features/auth/register/register_provider.dart';
import 'package:smart_home_app/resources/router/router.dart';

// ignore: must_be_immutable
class MyApp extends StatefulWidget {
  MyApp._internal();
  int appState = 0;
  static final MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: AuthProvider(),
        ),
        ChangeNotifierProvider.value(
          value: LoginProvider(),
        ),
        ChangeNotifierProvider.value(
          value: RegisterProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: Routes.boardingRoute,
      ),
    );
  }
}
