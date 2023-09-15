import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/features/home/presentation/screens/transaction_screen.dart';
import 'package:asbeza/features/home/presentation/widgets/obscure_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/custom_list_tile.dart';
import '../widgets/greeting_text_widget.dart';
import '../widgets/custom_rectangular_card.dart';
import '../widgets/main_background_widget.dart';
import 'debt_screen.dart';
import 'profile_screen.dart';
import 'statistics_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            selectedIndex = index;
          });
          _controller.animateToPage(
            selectedIndex,
            duration: const Duration(seconds: 1),
            curve: Curves.linearToEaseOut,
          );
        },
        children: const [
          TransactionScreen(),
          StatScreen(),
          DebtScreen(),
          ProfileScreen()
        ],
      ),
      floatingActionButton: selectedIndex == 0 || selectedIndex == 2
          ? Container(
              padding: EdgeInsets.all(1.w),
              width: 21.w,
              height: 21.h,
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
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 80,
        shadowColor: primaryColor,
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 31.w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        isSelected: selectedIndex == 0,
                        iconSize: 9.w,
                        icon: Image.asset(selectedIndex == 0
                            ? 'assets/icons/home_pressed.png'
                            : 'assets/icons/home.png'),
                        splashColor: primaryColor,
                        onPressed: () {
                          navigateToPage(0);
                        },
                      ),
                      IconButton(
                        iconSize: 9.w,
                        isSelected: selectedIndex == 1,
                        icon: Image.asset(selectedIndex == 1
                            ? 'assets/icons/stats_pressed.png'
                            : 'assets/icons/stats.png'),
                        onPressed: () {
                          navigateToPage(1);
                        },
                      ),
                    ]),
              ),
              SizedBox(
                width: 32.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 9.w,
                      isSelected: selectedIndex == 2,
                      icon: Image.asset(selectedIndex == 2
                          ? 'assets/icons/debt_pressed.png'
                          : 'assets/icons/debt.png'),
                      onPressed: () {
                        navigateToPage(2);
                      },
                    ),
                    IconButton(
                      iconSize: 9.w,
                      isSelected: selectedIndex == 3,
                      icon: Image.asset(selectedIndex == 3
                          ? 'assets/icons/profile_pressed.png'
                          : 'assets/icons/profile.png'),
                      onPressed: () {
                        navigateToPage(3);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToPage(int index) {
    setState(() {
      _controller.jumpToPage(index);
      selectedIndex = index;
    });
  }
}
