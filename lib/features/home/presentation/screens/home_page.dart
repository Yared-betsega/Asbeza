import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/features/home/presentation/widgets/obscure_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../widgets/custom_list_tile.dart';
import '../widgets/greeting_text_widget.dart';
import '../widgets/income_expense.dart';
import '../widgets/main_background_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _myPage = PageController(initialPage: 0);

  final List<Map<String, dynamic>> foodList = [
    {
      'title': "Food",
      'type': 1,
      'date': "Today",
      'amount': '850',
      'add': true,
    },
    {
      'title': "Cloth",
      'type': 2,
      'date': "Yesterday",
      'amount': '1200',
      'add': false,
    },
    {
      'title': "Transport",
      'type': 3,
      'date': "Today",
      'amount': '850',
      'add': true,
    },
    {
      'title': "Debt",
      'type': 4,
      'date': "Yesterday",
      'amount': '1200',
      'add': false,
    },
  ];
  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _myPage,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Stack(
            children: [
              const MainBackground(),
              Padding(
                padding: EdgeInsets.only(top: 8.h, bottom: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const GreetingContent(),
                    Center(
                      child: Material(
                        elevation: 20,
                        shadowColor: primaryColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
                        child: Container(
                          width: 88.w,
                          height: 22.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            color: getStartedButtonColor2,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(4.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Total Balance",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.sp),
                                        ),
                                        ObscureTextWidget(
                                            text: '\$2,548.00',
                                            isObscure: isObscure,
                                            isTotalBalance: true)
                                      ],
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          isObscure = !isObscure;
                                        });
                                      },
                                      icon: Icon(
                                        isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IncomeExpense(
                                      isObscure: isObscure,
                                      name: "Income",
                                      amount: '\$1,814.00',
                                      icon: Icons.arrow_downward,
                                    ),
                                    IncomeExpense(
                                      isObscure: isObscure,
                                      name: "Expenses",
                                      amount: '\$218.00',
                                      icon: Icons.arrow_upward,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transactions History",
                                style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "See all",
                                  style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              itemCount: 50,
                              itemBuilder: (BuildContext context, int index) =>
                                  CustomListTile(
                                      transaction: foodList[index % 4]),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Text(
            'Index 0: Home',
            style: optionStyle,
          ),
          Text(
            'Index 1: Business',
            style: optionStyle,
          ),
          Text(
            'Index 2: School',
            style: optionStyle,
          ),
        ],
      ),
      floatingActionButton: SizedBox(
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
      bottomNavigationBar: BottomAppBar(
        shadowColor: primaryColor,
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 10.h,
          width: 100.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 35.w,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        isSelected: selectedIndex == 0,
                        iconSize: 9.w,
                        icon: const Icon(Icons.home),
                        splashColor: primaryColor,
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(0);
                            selectedIndex = 0;
                          });
                        },
                      ),
                      IconButton(
                        iconSize: 9.w,
                        isSelected: selectedIndex == 1,
                        icon: const Icon(Icons.bar_chart),
                        onPressed: () {
                          setState(() {
                            _myPage.jumpToPage(1);
                            selectedIndex = 1;
                          });
                        },
                      ),
                    ]),
              ),
              SizedBox(
                width: 35.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      iconSize: 9.w,
                      isSelected: selectedIndex == 2,
                      icon: const Icon(Icons.money),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(2);
                          selectedIndex = 2;
                        });
                      },
                    ),
                    IconButton(
                      iconSize: 9.w,
                      isSelected: selectedIndex == 3,
                      icon: const Icon(Icons.person),
                      onPressed: () {
                        setState(() {
                          _myPage.jumpToPage(3);
                          selectedIndex = 3;
                        });
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
}
