import 'package:flutter/material.dart';
import 'package:kan_lazim/core/custom_button.dart';
import 'package:kan_lazim/core/custom_textfield.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/core/padding_borders.dart';
import 'package:kan_lazim/screens/auth/auth_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                authTitle(context, "Hesap Oluştur!"),
                const SizedBox(height: 15),
                Card(
                  child: Container(
                    padding: PaddingBorderConstant.paddingAllHigh,
                    child: const Column(
                      children: [
                        CustomTextField(labelText: "E-posta"),
                        SizedBox(height: 15),
                        CustomTextField(labelText: "İsim"),
                        SizedBox(height: 15),
                        CustomTextField(labelText: "İl"),
                        SizedBox(height: 15),
                        CustomTextField(labelText: "İlçe"),
                        SizedBox(height: 15),
                        CustomTextField(
                          labelText: "Şifre",
                          isPassword: true,
                        ),
                        SizedBox(height: 30),
                        CustomTextField(
                          labelText: "Şifreyi onayla",
                          isPassword: true,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                CustomMainButton(onPressed: () {}, text: "Kayıt Ol", buttonWidth: 0.75),
                const AuthWithGoogle(isRegisterPage: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
