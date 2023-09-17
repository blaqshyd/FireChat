import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:firechat/constants/app_exports.dart';
import 'package:provider/provider.dart';

import '../controller/auth_service.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({
    Key? key,
  }) : super(key: key);

  // final VoidCallback onTap;

  @override
  SignupViewState createState() => SignupViewState();
}

class SignupViewState extends State<SignupView> {
  final _emailCtrl = TextEditingController();
  final _pwdCtrl = TextEditingController();
  final _confirmCtrl = TextEditingController();

  void signUp() async {
    if (_pwdCtrl.text != _confirmCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match')),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.createUser(
        context: context,
        email: _emailCtrl.text,
        password: _pwdCtrl.text,
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
                obscureText: true,
                textInputAction: TextInputAction.next,
              ),
              16.sbH,
              CustomTextf(
                controller: _confirmCtrl,
                hintText: 'Confirm Password',
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              32.sbH,
              ButtonUtil.filled(
                text: 'Sign Up',
                cta: signUp,
                bgColor: Pallete.primaryColor,
              ),
              32.sbH,
              RichText(
                text: TextSpan(
                  style: AppStyle.bFormHint,
                  children: [
                    const TextSpan(text: 'Already have an account?'),
                    TextSpan(
                      style: AppStyle.sDark400,
                      text: '  Login',
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => AppRouter.pushReplacement(const LoginView()),
                    )
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
