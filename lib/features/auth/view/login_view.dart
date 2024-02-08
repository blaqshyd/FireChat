// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:firechat/constants/app_exports.dart';
import 'package:firechat/features/auth/view/signup_view.dart';
import 'package:firechat/features/auth/controller/auth_service.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  // final VoidCallback onTap;
  const LoginView({
    Key? key,
    // required this.onTap,
  }) : super(key: key);

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
  final _emailCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();

  void signInGoogle() {
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.googleSignIn();
  }

  void signIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.signInUser(
        email: _emailCtrl.text,
        password: _pwdCtrl.text,
        context: context,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: AppConstants.padding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppConstants.appBar(),
              32.sbH,
              CustomTextf(
                controller: _emailCtrl,
                hintText: 'Email Address',
                textInputAction: TextInputAction.next,
              ),
              16.sbH,
              CustomTextf(
                controller: _pwdCtrl,
                hintText: 'Password',
                textInputAction: TextInputAction.done,
                obscureText: true,
              ),
              32.sbH,
              ButtonUtil.filled(
                text: 'Login',
                cta: signIn,
                bgColor: Pallete.primaryColor,
              ),
              12.sbH,
              const Row(children: [
                Expanded(child: Divider()),
                Text('or'),
                Expanded(child: Divider())
              ]),
              12.sbH,
              ButtonUtil.outlined(
                text: 'Sign in with Google',
                cta: signInGoogle,
                // bgColor: Pallete.primaryColor,
              ),
              32.sbH,
              RichText(
                text: TextSpan(
                  style: AppStyle.bFormHint,
                  children: [
                    const TextSpan(text: 'New member?'),
                    TextSpan(
                        style: AppStyle.sDark400,
                        text: '  Signup',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () =>
                              AppRouter.pushReplacement(const SignupView()))
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
