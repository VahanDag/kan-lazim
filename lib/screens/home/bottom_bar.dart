import 'package:flutter/material.dart';
import 'package:kan_lazim/core/colors.dart';
import 'package:kan_lazim/models/user_model.dart';
import 'package:kan_lazim/screens/blood_request/blood_request.dart';
import 'package:kan_lazim/screens/doners_list/doners_list.dart';
import 'package:kan_lazim/screens/home/home_page.dart';
import 'package:kan_lazim/screens/profile/profile.dart';
import 'package:kan_lazim/services/firebase_service.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  UserModel _userModel = UserModel();

  late final List<Widget> _pages;
  @override
  void initState() {
    getModel();
    _pages = [
      HomePage(
        mdoel: _userModel,
      ),
      const BloodDoners(),
      const BloodRequest(),
      const ProfilePage(),
    ];
    super.initState();
  }

  Future<void> getModel() async {
    _userModel = await FirebaseService().getUser();
    setState(() {});
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: ColorsConstant.locationadres,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Anasayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_search),
            label: 'Donör Bulun',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.water_drop_rounded),
            label: 'istek',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
