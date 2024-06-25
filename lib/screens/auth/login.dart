// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/core/custom_button.dart';
import 'package:kan_lazim/core/custom_textfield.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/screens/auth/auth_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: context.deviceWidth * 0.9,
            child: Column(
              children: [
                const SizedBox(height: 90),
                authTitle(context, "Hoşgeldin!"),
                const SizedBox(height: 30),
                const CustomTextField(
                  labelText: "E-posta adresi",
                ),
                const SizedBox(height: 30),
                const CustomTextField(
                  labelText: "Şifre",
                  isPassword: true,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Şifremi unuttum?",
                          style: context.textTheme.titleSmall?.copyWith(color: ColorsConstant.redFrame),
                        ))),
                const SizedBox(height: 30),
                CustomMainButton(onPressed: () {}, text: "Giriş Yap", buttonWidth: 0.75),
                const AuthWithGoogle(isRegisterPage: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
