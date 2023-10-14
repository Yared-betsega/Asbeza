import 'package:asbeza/asbeza.dart';

class StatScreen extends StatefulWidget {
  const StatScreen({super.key});

  @override
  State<StatScreen> createState() => _StatScreenState();
}

class _StatScreenState extends State<StatScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                CustomNavigator(
                  isStat: true,
                  color: Colors.black,
                  text: 'Statistics',
                  onPressed: () {},
                  iconUrl: 'assets/icons/stat/download_stat.svg',
                ),
              ],
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Row(
                  children: [],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
