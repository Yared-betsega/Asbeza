import 'package:asbeza/asbeza.dart';

class ProfilePageTile extends StatelessWidget {
  const ProfilePageTile({
    super.key,
    required this.title,
    required this.image_path,
    required this.onTap,
  });
  final String title;
  final String image_path;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.w),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(
              image_path,
              width: 8.w,
            ),
            SizedBox(
              width: 7.w,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16.5.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
