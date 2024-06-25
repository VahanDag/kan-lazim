import 'package:flutter/material.dart';
import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/core/extensions.dart';
import 'package:kan_lazim/screens/home/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsConstant.appbar,
        title: Row(
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 50,
            ),
            const SizedBox(width: 10),
            const Text(
              'Kan Lazım',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: ColorsConstant.location,
                      size: 40,
                    ),
                    Text(
                      'Ankara',
                      style: TextStyle(fontSize: 20, color: ColorsConstant.locationadres, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/home.jpg',
              width: ContextExtension(context).deviceWidth * 0.8,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: ContextExtension(context).deviceWidth * 0.8,
                height: ContextExtension(context).deviceHeight * 0.25,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'assets/images/location.jpg',
                          width: ContextExtension(context).deviceWidth * 0.15,
                        ),
                        const Text(
                          "Yakındaki Bağışçılar",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: ContextExtension(context).deviceWidth * 0.9,
              height: ContextExtension(context).deviceHeight * 0.25,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: ContextExtension(context).deviceWidth * 0.4,
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/kanbagisi.jpg',
                              alignment: Alignment.center,
                            ),
                            const Text(
                              'Kan Bankası',
                              style: TextStyle(fontSize: 20, color: ColorsConstant.locationadres, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: ContextExtension(context).deviceWidth * 0.4,
                    child: InkWell(
                      onTap: () {},
                      child: Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/images/hospital.jpg',
                            ),
                            const Text(
                              'Hastane',
                              style: TextStyle(fontSize: 20, color: ColorsConstant.locationadres, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
