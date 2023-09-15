import 'package:asbeza/features/home/presentation/widgets/main_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/constants/colors.dart';
import '../widgets/custom_list_tile.dart';
import '../widgets/greeting_text_widget.dart';
import '../widgets/custom_rectangular_card.dart';
import '../widgets/obscure_text_widget.dart';
import '../../../../core/constants/data_variables.dart';

class DebtScreen extends StatefulWidget {
  const DebtScreen({
    super.key,
  });

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  bool isObscure = true;
  final List<Map<String, dynamic>> foodList = FoodData.foodList;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainBackground(),
        Padding(
          padding: EdgeInsets.only(
            top: 6.h,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Column(
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
                          height: 20.h,
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
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
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
                                      name: "Debt",
                                      amount: '\$1,814.00',
                                      icon: Icons.arrow_upward,
                                    ),
                                    CustomRectangularCard(
                                      isObscure: isObscure,
                                      name: "Credit",
                                      amount: '\$218.00',
                                      icon: Icons.arrow_downward,
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
                flex: 3,
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
                              "Debt & Credit History",
                              style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp),
                            ),
                            TextButton(
                              onPressed: () {
                                context.go('/home/debtHistoryDetails');
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
