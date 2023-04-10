import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/features/auth/providers/login_provider.dart';
import 'package:smart_home_app/features/auth/providers/register_provider.dart';
import 'package:smart_home_app/features/auth/widgets/enter_user_data_view.dart';
import 'package:smart_home_app/features/auth/widgets/login_or_register_view.dart';
import 'package:smart_home_app/utils/managers/asset_manager.dart';
import 'package:smart_home_app/utils/managers/color_manager.dart';
import 'package:smart_home_app/utils/managers/string_manager.dart';
import 'package:smart_home_app/utils/managers/style_manager.dart';
import 'package:smart_home_app/utils/managers/value_manager.dart';
import 'package:smart_home_app/utils/router/router.dart';
import 'package:smart_home_app/utils/widgets/green_gradient_button_widget.dart';

enum AuthMode { signUp, signIn, dataIn, noData }

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  AuthMode _authMode = AuthMode.signIn;
  AuthMode _dataMode = AuthMode.noData;

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    repeatPasswordController.dispose();
    super.dispose();
  }

  bool get isEmailNotEmpty => emailController.text.isNotEmpty;
  bool get isPasswordConfirmed =>
      passwordController == repeatPasswordController;
  bool get isEnterUserData => _dataMode == AuthMode.dataIn;
  bool get isRegisterView => _authMode == AuthMode.signUp;
  bool get isLoginView => _authMode == AuthMode.signIn;
  bool get isNotEnterUserData => _dataMode == AuthMode.noData;

  void _switchAuthMode() {
    if (isLoginView) {
      setState(() {
        _authMode = AuthMode.signUp;
      });
    } else if (isRegisterView) {
      setState(() {
        _authMode = AuthMode.signIn;
        _dataMode = AuthMode.noData;
      });
    }
  }

  void _switchDataMode() {
    if (isNotEnterUserData) {
      setState(() {
        _dataMode = AuthMode.dataIn;
      });
    } else if (isEnterUserData) {
      setState(() {
        _dataMode = AuthMode.noData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final registerProvider = Provider.of<RegisterProvider>(context);

    void signUserIn() {
      loginProvider.signIn(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );
    }

    void signUserUp() {
      registerProvider.register(
        email: emailController.text,
        password: passwordController.text,
        context: context,
      );
    }

    void onPressed() {
      if (isLoginView) {
        signUserIn();
      } else if (isRegisterView && isNotEnterUserData) {
        _switchDataMode();
      } else if (isEnterUserData) {
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
                isEnterUserData
                    ? EnterUserDataView(
                        nameController: nameController,
                        surnameController: surnameController,
                        ageController: ageController,
                      )
                    : LoginOrRegisterView(
                        emailController: emailController,
                        passwordController: passwordController,
                        isRegisterView: isRegisterView,
                        repeatPasswordController: repeatPasswordController,
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
