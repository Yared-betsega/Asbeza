import 'package:asbeza/core/colors.dart';
import 'package:asbeza/core/styles.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width, // Set container width
            height: MediaQuery.of(context).size.height, // Set container height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding.jpg'),
                fit: BoxFit.cover, // Ensure the image covers the container
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "Spend Smarter",
                  style: onboardingTextStyle,
                ),
                const Text(
                  "Save More",
                  style: onboardingTextStyle,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 30.0,
                    child: Container(
                      padding: EdgeInsets.all(4.5.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: primaryColor,
                      ),
                      child: InkWell(
                        onTap: () {},
                        child: const Center(
                            child: Text(
                          "Get Started",
                          style: getStartedTextStyle,
                        )),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already Have Account? ",
                      style: alreadyHaveAccountTextStyle,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Log In",
                          style: loginTextStyle,
                        ))
                  ],
                ),
                SizedBox(
                  height: 3.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
