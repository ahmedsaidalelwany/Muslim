import 'package:flutter/material.dart';

import '../hadeth/Ui/hadeth_tab.dart';
import '../quran/Ui/quran_tab.dart';
import '../sebha/Ui/sebhatab.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [QuranTab(), HadethTab(), SebhaTab()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Wallpaper.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: tabs[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          selectedIconTheme: const IconThemeData(size: 30),
          unselectedIconTheme: const IconThemeData(size: 25),
          unselectedItemColor: Color(0xFF45614A),
          backgroundColor: const Color(0xFF7D9E83),
          currentIndex: currentIndex,
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book_outlined),
              label: ("القرآن الكريم"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shield_moon_rounded),
              label: ("الأحاديث النبوية"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.spa_rounded),
              label: ("السبحة"),
            ),
          ],
        ),
      ),
    );
  }
}
