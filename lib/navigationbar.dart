//This is the page which has the navigator design.

import 'package:flutter/material.dart';
import 'signInPage.dart';
import 'mainPage.dart';
import 'package:enefty_icons/enefty_icons.dart';

//-----navigation bar----

class navigationBar extends StatefulWidget {
  const navigationBar({super.key});
  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const main_page(),
      bottomNavigationBar: Container(
        height: 100,
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          // Yükseklik artırma
          elevation: 40.0,
          // Rengi değiştirme
          backgroundColor: const Color.fromARGB(
              255, 0, 56, 102), // istediğiniz rengi seçebilirsiniz
          selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(EneftyIcons.home_outline),
              label: 'Ana Sayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(EneftyIcons.search_normal_outline),
              label: 'Ara',
            ),
            BottomNavigationBarItem(
              icon: Icon(EneftyIcons.profile_outline),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}
