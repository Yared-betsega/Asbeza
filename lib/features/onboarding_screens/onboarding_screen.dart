import 'package:asbeza/core/colors.dart';
import 'package:asbeza/core/styles.dart';
import 'package:flutter/material.dart';

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
                image: AssetImage('assets/images/onboarding.png'),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(50),
                    elevation: 30.0,
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: getStartedButtonColor1,
                        borderRadius: BorderRadius.circular(50),
                        gradient: RadialGradient(
                            colors: [getStartedButtonColor1, primaryColor],
                            radius: 5),
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
                    const Text("Already Have Account? "),
                    TextButton(onPressed: () {}, child: const Text("Log In"))
                  ],
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
