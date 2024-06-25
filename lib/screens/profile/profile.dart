import 'package:flutter/material.dart';

import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/core/custom_button.dart';
import 'package:kan_lazim/core/extensions.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            children: [
              Container(
                width: ContextExtension(context).deviceWidth,
                height: ContextExtension(context).deviceHeight * 0.2,
                color: ColorsConstant.profile,
              ),
              Positioned(
                top: ContextExtension(context).deviceHeight * 0.1,
                left: ContextExtension(context).deviceWidth * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
              ),
            ],
          ),
          const Text(
            'Hasan Taha Künkül',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: Colors.black,
            indent: 20,
            endIndent: 20,
          ),
          SizedBox(
            width: ContextExtension(context).deviceWidth * 0.9,
            height: ContextExtension(context).deviceHeight * 0.2,
            child: const Card(
                shadowColor: ColorsConstant.redFrame,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Profilewidget(icon: Icons.location_on, text: 'İl/İlçe:', text2: 'İstanbul/ Üsküdar'),
                    Profilewidget(icon: Icons.email, text: 'Email:', text2: 'tahaknkl2323@gmail.com'),
                    Profilewidget(icon: Icons.water_drop_rounded, text: "Kan Grubu", text2: "Kan Grubu Girilmedi"),
                  ],
                )),
          ),
          const SizedBox(height: 10),
          CustomMainButton(
            onPressed: () {},
            text: "Taleplerim",
            buttonWidth: 0.9,
            isOutline: true,
          ),
          CustomMainButton(
            onPressed: () {},
            text: "Çıkış Yap",
            buttonWidth: 0.9,
            isOutline: false,
          ),
        ],
      ),
    );
  }
}

class Profilewidget extends StatelessWidget {
  const Profilewidget({
    super.key,
    required this.icon,
    required this.text,
    required this.text2,
  });

  final IconData icon;
  final String text;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8), // İkon ile metin arasına boşluk ekledik
            Text(text),
          ],
        ),
        Expanded(
          // Text2'yi sağa doğru genişletiyoruz
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              text2,
              textAlign: TextAlign.right, // Sağa hizalıyoruz
            ),
          ),
        ),
      ],
    );
  }
}
