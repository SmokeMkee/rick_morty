import 'package:flutter/material.dart';
import 'package:lesson3/constants/app_assets.dart';
import 'package:lesson3/constants/app_colors.dart';
import 'package:lesson3/constants/app_styles.dart';

import '../../generated/l10n.dart';
import '../widgets/alter_dialogs.dart';
import 'widgets/login_text_field.dart';
import 'widgets/password_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  //press button function
  void pressButton(String login, String password) {
    if (login == 'qwerty' && password == '123456ab') {
      Navigator.of(context).pushReplacementNamed('/auth_screen/nav_bar');
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogs(
            errorText: S.of(context).wrongLoginAndPassword,
            contentText: S.of(context).wrongLoginAndPassword,
          );
        },
      );
    }
  }

  final _formKey = GlobalKey<FormState>(); // validate form key

  // input controllers
  TextEditingController login = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    login.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Image.asset(AppAssets.images.logo),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).login,
                          style: AppStyles.s14w400.copyWith(
                            color: AppColors.loginAndPasswordTextColor,
                            height: 2,
                          ),
                        ),
                        LoginTextField(controller: login),
                        const SizedBox(height: 10.0),
                        Text(
                          S.of(context).password,
                          style: AppStyles.s14w400.copyWith(
                            color: AppColors.loginAndPasswordTextColor,
                            height: 2,
                          ),
                        ),
                        PasswordTextField(controller: password),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                pressButton(login.text, password.text);
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                S.of(context).signIn,
                                style: AppStyles.s16w400,
                              ),
                            ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                AppColors.authButtonColor,
                              ),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    side: BorderSide.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(S.of(context).dontHaveAcc,
                            style: AppStyles.s14w400),
                        const SizedBox(width: 10),
                        Text(
                          S.of(context).create,
                          style: AppStyles.s14w400
                              .copyWith(color: AppColors.createNewAccount),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
