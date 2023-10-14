import 'package:asbeza/asbeza.dart';

class BottomNavbarWithoutFloatingActionButton extends StatelessWidget {
  const BottomNavbarWithoutFloatingActionButton({
    super.key,
    required this.selectedIndex,
    required this.navigateToPage,
  });
  final int selectedIndex;
  final void Function(int) navigateToPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          isSelected: selectedIndex == 0,
          iconSize: 9.w,
          icon: Image.asset(selectedIndex == 0
              ? 'assets/icons/home_pressed.png'
              : 'assets/icons/home.png'),
          splashColor: primaryColor,
          onPressed: () {
            navigateToPage(0);
          },
        ),
        IconButton(
          iconSize: 9.w,
          isSelected: selectedIndex == 1,
          icon: Image.asset(selectedIndex == 1
              ? 'assets/icons/stats_pressed.png'
              : 'assets/icons/stats.png'),
          onPressed: () {
            navigateToPage(1);
          },
        ),
        IconButton(
          iconSize: 9.w,
          isSelected: selectedIndex == 2,
          icon: Image.asset(selectedIndex == 2
              ? 'assets/icons/debt_pressed.png'
              : 'assets/icons/debt.png'),
          onPressed: () {
            navigateToPage(2);
          },
        ),
        IconButton(
          iconSize: 9.w,
          isSelected: selectedIndex == 3,
          icon: Image.asset(selectedIndex == 3
              ? 'assets/icons/profile_pressed.png'
              : 'assets/icons/profile.png'),
          onPressed: () {
            navigateToPage(3);
          },
        ),
      ],
    );
  }
}
