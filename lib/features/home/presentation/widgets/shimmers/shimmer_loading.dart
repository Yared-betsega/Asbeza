import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/constants/colors.dart';
import '../greeting_text_widget.dart';
import '../main_background_widget.dart';
import 'shimmers.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({super.key});

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
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
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
                                        Center(
                                          child: getBalanceTextShimmer(
                                              width: 35.w, height: 6.h),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: getBalanceTextShimmer(
                                          width: 35.w, height: 6.h),
                                    ),
                                    Center(
                                      child: getBalanceTextShimmer(
                                          width: 35.w, height: 6.h),
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
                                // context.go('/home/transactionHistoryDetails');
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
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) =>
                                Center(
                              child: getCustomListTileShimmer(
                                  width: double.infinity, height: 10.h),
                            ),
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
