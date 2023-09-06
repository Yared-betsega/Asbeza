import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.transaction,
  });

  final Map<String, dynamic> transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 0),
      leading: Image(
        width: 10.w,
        image: AssetImage(
            'assets/images/${transaction['type'] == 1 ? 'food.jpeg' : transaction['type'] == 2 ? 'cloth.png' : transaction['type'] == 3 ? 'transport.png' : 'debt.png'}'),
      ),
      title: Text(
        transaction['title'],
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        transaction['date'],
        style: TextStyle(
          fontSize: 16.5.sp,
          fontWeight: FontWeight.w300,
          fontFamily: 'Inter',
        ),
      ),
      trailing: Text(
        "${transaction['add'] ? '+' : '-'}${transaction['amount']} .00 br",
        style: TextStyle(
            color: transaction['add'] ? Colors.green : Colors.red,
            fontSize: 17.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
