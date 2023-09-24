import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/features/home/presentation/screens/transaction_screen.dart';
import 'package:asbeza/features/home/presentation/widgets/bottom_navbar_with_floating_action_button.dart';
import 'package:asbeza/features/home/presentation/widgets/bottom_navbar_without_floating_action_button.dart';
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
          child: selectedIndex == 0 || selectedIndex == 2
              ? BottomNavbarWithFloatingActionButton(
                  selectedIndex: selectedIndex,
                  navigateToPage: navigateToPage,
                )
              : BottomNavbarWithoutFloatingActionButton(
                  selectedIndex: selectedIndex,
                  navigateToPage: navigateToPage,
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
