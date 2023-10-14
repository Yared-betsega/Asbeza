import 'package:asbeza/asbeza.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MainBackground(),
        Padding(
          padding: EdgeInsets.only(top: 6.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomNavigator(
                      isStat: false,
                      text: "Profile",
                      color: Colors.white,
                      onPressed: () {},
                      iconUrl: 'assets/icons/profile/notification.svg',
                    ),
                    Center(
                      child: SizedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 12.w,
                                backgroundImage: const AssetImage(
                                    'assets/images/default_profile.png'),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Enjelin Morgeana',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '@johndoe',
                                style: TextStyle(
                                    fontSize: 16, color: primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InviteFriends(
                          title: "Invite friends",
                          imagePath: "assets/icons/profile/diamond.png",
                          onTap: () {}),
                      Container(
                        height: 1.h,
                        decoration: const BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Color.fromARGB(255, 228, 228, 228),
                            ),
                          ),
                        ),
                      ),
                      ProfilePageTile(
                          title: "Account info",
                          image_path: "assets/icons/profile/account_info.svg",
                          onTap: () {}),
                      ProfilePageTile(
                          title: "Personal profile",
                          image_path:
                              "assets/icons/profile/personal_profile.svg",
                          onTap: () {}),
                      ProfilePageTile(
                          title: "Message center",
                          image_path: "assets/icons/profile/envelope.svg",
                          onTap: () {}),
                      ProfilePageTile(
                          title: "Login and security",
                          image_path: "assets/icons/profile/security.svg",
                          onTap: () {}),
                      ProfilePageTile(
                          title: "Data and privacy",
                          image_path: "assets/icons/profile/privacy.svg",
                          onTap: () {}),
                      ProfilePageTile(
                          title: "Sign Out",
                          image_path: "assets/icons/profile/privacy.svg",
                          onTap: () {
                            _showConfirmationDialog(context);
                          }),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Sign Out'),
          content: const Text('Are you sure you want to sign out?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();

                _performSignOut(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _performSignOut(BuildContext context) {
    BlocProvider.of<LoginBloc>(context).add(Logout());
    context.go('/auth');
  }
}
