import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/auth/pages/add_data_page.dart';
import 'package:smart_home_app/features/auth/providers/auth_provider.dart';
import 'package:smart_home_app/features/main/pages/main_page.dart';
import 'package:smart_home_app/features/auth/pages/login_or_register_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthProvider>(
        builder: (context, authProvider, _) {
          final user = authProvider.user;
          final isNewUser = authProvider.isNewUser;
          final hasAgeParameter = authProvider.hasAgeParameter;
          if (user != null && hasAgeParameter == true) {
            return const MainPage();
          } else if (user != null && hasAgeParameter == false) {
            return const AddDataPage();
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
