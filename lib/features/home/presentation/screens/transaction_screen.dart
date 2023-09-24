import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/greeting_text_widget.dart';
import '../widgets/custom_rectangular_card.dart';
import '../widgets/main_background_widget.dart';
import '../widgets/obscure_text_widget.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  bool isObscure = true;
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const MainBackground(),
        Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    GreetingContent(),
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
                                    CustomRectangularCard(
                                      isObscure: isObscure,
                                      name: "Income",
                                      amount: '\$1,814.00',
                                      icon: Icons.arrow_downward,
                                    ),
                                    CustomRectangularCard(
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
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Row(
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
                              onPressed: () {
                                context.go('/home/transactionHistoryDetails');
                              },
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
                      ),
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 1.w, vertical: 0),
                            itemCount: 50,
                            itemBuilder: (BuildContext context, int index) =>
                                CustomListTile(
                                    transaction: foodList[index % 4]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
