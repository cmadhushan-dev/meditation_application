import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_application/pages/main_screens/create_custom_excerices_page.dart';
import 'package:meditation_application/pages/main_screens/custome_excerices_page.dart';
import 'package:meditation_application/pages/main_screens/home_page.dart';
import 'package:meditation_application/pages/main_screens/mainful_excerices_page.dart';
import 'package:meditation_application/pages/main_screens/profile_page.dart';
import 'package:meditation_application/utilites/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _pages = [
    HomePage(),
    MainfulExcericesPage(),
    CreateCustomExcericesPage(),
    CustomeExcericesPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      print(index);
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: BottomNavigationBar(
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 0
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/brain.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 1
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'meditation',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/circle-plus.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 2
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'new exceices',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/file-plus-2.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 3
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'view exceices',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/user-round-cog.svg",
                colorFilter: ColorFilter.mode(
                  _selectedIndex == 4
                      ? AppColors.primaryPurple
                      : AppColors.primaryGrey,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
          selectedItemColor: AppColors.primaryPurple,
          unselectedItemColor: Colors.grey,
        ),
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
    );
  }
}
