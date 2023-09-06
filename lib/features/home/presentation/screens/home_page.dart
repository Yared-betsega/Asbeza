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
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackground(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const GreetingContent(),
                Center(
                  child: Material(
                    elevation: 20,
                    shadowColor: primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Total Balance",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.sp),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          itemCount: 50,
                          itemBuilder: (BuildContext context, int index) =>
                              CustomListTile(transaction: foodList[index % 4]),
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
    );
  }
}
