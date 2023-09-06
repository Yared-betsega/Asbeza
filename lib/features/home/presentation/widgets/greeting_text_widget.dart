import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GreetingContent extends StatelessWidget {
  const GreetingContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Good afternoon",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                "Engelin Morgeana",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          IconButton(
            icon: Icon(
              Icons.notifications_outlined,
              fill: 0.1,
              color: Colors.white,
              size: 7.w,
            ),
            onPressed: () {
              // Add your menu button logic here
            },
          ),
        ],
      ),
    );
  }
}
