import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/auth/providers/login_provider.dart';
import 'package:smart_home_app/features/auth/providers/register_provider.dart';
import 'package:smart_home_app/features/auth/providers/user_data_provider.dart';
import 'package:smart_home_app/features/auth/widgets/login_or_register_view.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';
import 'package:smart_home_app/utils/widgets/green_gradient_button_widget.dart';

enum AuthMode { signUp, signIn }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _houseIdController = TextEditingController();
  AuthMode _authMode = AuthMode.signIn;

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _repeatPasswordController.dispose();
    _nameController.dispose();
    _surnameController.dispose();
    _ageController.dispose();
    _houseIdController.dispose();
    super.dispose();
  }

  bool get isEmailNotEmpty => _emailController.text.isNotEmpty;
  bool get isPasswordConfirmed =>
      _passwordController == _repeatPasswordController;
  bool get isRegisterView => _authMode == AuthMode.signUp;
  bool get isLoginView => _authMode == AuthMode.signIn;

  void _switchAuthMode() {
    if (isLoginView) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
    } else if (isRegisterView) {
      setState(() {
        _authMode = AuthMode.signIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final registerProvider = Provider.of<RegisterProvider>(context);
    final userDataProvider = Provider.of<UserDataProvider>(context);

    void signUserIn() {
      loginProvider.signIn(
        email: _emailController.text,
        password: _passwordController.text,
        context: context,
      );
    }

    void signUserUp() async {
      try {
        await registerProvider.register(
          email: _emailController.text,
          password: _passwordController.text,
          context: context,
        );
      } catch (e) {
        print(e);
      }
      await userDataProvider.addUserData(
        email: _emailController.text,
        name: _nameController.text,
        surname: _surnameController.text,
        age: int.parse(_ageController.text),
        houseID: _houseIdController.text,
        context: context,
      );
    }

    void onPressed() {
      if (isLoginView) {
        signUserIn();
      } else if (isRegisterView) {
        signUserUp();
      }
    }

    return Scaffold(
      backgroundColor: ColorManager.darkGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: PaddingManager.p12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: PaddingManager.p8),
                  child: SizedBox(
                    width: SizeManager.s250,
                    height: SizeManager.s250,
                    child: Image.asset(
                      ImageManager.logoTextUnder,
                    ),
                  ),
                ),
                LoginOrRegisterView(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  isRegisterView: isRegisterView,
                  repeatPasswordController: _repeatPasswordController,
                  nameController: _nameController,
                  surnameController: _surnameController,
                  ageController: _ageController,
                  houseIdController: _houseIdController,
                ),
                isLoginView
                    ? Padding(
                        padding: const EdgeInsets.only(
                          right: PaddingManager.p28,
                          left: PaddingManager.p28,
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushNamed(Routes.forgotPasswordRoute);
                            },
                            child: const Text(
                              StringsManager.forgotPassword,
                              style: StyleManager.loginPageSubTextTextStyle,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Padding(
                  padding: const EdgeInsets.only(top: PaddingManager.p2),
                  child: LimeGreenRoundedButtonWidget(
                    onTap: onPressed,
                    title: isLoginView
                        ? StringsManager.signIn
                        : StringsManager.signUp,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: PaddingManager.p28,
                    right: PaddingManager.p28,
                    top: PaddingManager.p18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isLoginView
                            ? StringsManager.dontHaveAcc
                            : StringsManager.haveAcc,
                        style: StyleManager.loginPageSubTextTextStyle,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: PaddingManager.p8),
                        child: GestureDetector(
                          onTap: _switchAuthMode,
                          child: Text(
                            isLoginView
                                ? StringsManager.signUp
                                : StringsManager.signIn,
                            style:
                                StyleManager.loginPageSubButtonSmallTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ).animate().fadeIn(duration: 500.ms),
          ),
        ),
      ),
    );
  }
}
