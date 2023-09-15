import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/features/home/presentation/screens/debt_screen.dart';
import 'package:asbeza/features/home/presentation/screens/profile_screen.dart';
import 'package:asbeza/features/home/presentation/screens/statistics_screen.dart';
import 'package:asbeza/features/home/presentation/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomePageTemp extends StatefulWidget {
  const HomePageTemp({super.key});

  @override
  State<HomePageTemp> createState() => _HomePageTempState();
}

class _HomePageTempState extends State<HomePageTemp> {
  static const List<Widget> _widgetOptions = <Widget>[
    TransactionScreen(),
    StatScreen(),
    DebtScreen(),
    ProfileScreen(),
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 3.5.h),
        width: 20.w,
        height: 20.h,
        child: FloatingActionButton(
          backgroundColor: primaryColor,
          shape: const CircleBorder(),
          onPressed: () {},
          elevation: 2.0,
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 10.w,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        color: getStartedButtonColor2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 2.h),
          child: GNav(
            gap: 8,
            backgroundColor: getStartedButtonColor2,
            color: Colors.black,
            activeColor: Colors.black,
            tabBackgroundColor: Colors.grey.shade300,
            padding: EdgeInsets.all(2.w),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.bar_chart,
                text: "Stats",
              ),
              GButton(
                icon: Icons.money,
                text: 'Debt',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
