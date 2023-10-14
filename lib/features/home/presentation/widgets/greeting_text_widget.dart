import 'package:asbeza/asbeza.dart';

class GreetingContent extends StatelessWidget {
  GreetingContent({
    super.key,
  });

  final currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(6.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Good afternoon",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                currentUser!.displayName!.toTitleCase(),
                style: const TextStyle(
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
