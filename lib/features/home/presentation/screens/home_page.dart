import 'package:asbeza/asbeza.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _controller = PageController(initialPage: 0);
  int selectedIndex = 0;
  bool isFormVisible = false;
  final _formKey = GlobalKey<FormState>();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadHome());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void toggleFormVisibility() {
    setState(() {
      isFormVisible = !isFormVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          pageSnapping: true,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
            _controller.animateToPage(
              selectedIndex,
              duration: const Duration(seconds: 1),
              curve: Curves.linearToEaseOut,
            );
          },
          children: const [
            TransactionScreen(),
            StatScreen(),
            DebtScreen(),
            ProfileScreen()
          ],
        ),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          top: isFormVisible ? null : 100.h,
          bottom: isFormVisible ? 0 : null, // Adjust as needed
          left: 0,
          right: 0,
          child: AddTransaction(formKey: _formKey),
        ),
      ]),
      floatingActionButton: selectedIndex == 0 || selectedIndex == 2
          ? Container(
              padding: EdgeInsets.all(1.w),
              width: 21.w,
              height: 21.h,
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                shape: const CircleBorder(),
                onPressed: toggleFormVisibility,
                elevation: 2.0,
                child: Icon(
                  !isFormVisible ? Icons.add : Icons.remove,
                  color: Colors.white,
                  size: 10.w,
                ),
              ),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: BottomAppBar(
        elevation: 80,
        shadowColor: primaryColor,
        surfaceTintColor: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 1.w),
          width: 100.w,
          child: selectedIndex == 0 || selectedIndex == 2
              ? BottomNavbarWithFloatingActionButton(
                  selectedIndex: selectedIndex,
                  navigateToPage: navigateToPage,
                )
              : BottomNavbarWithoutFloatingActionButton(
                  selectedIndex: selectedIndex,
                  navigateToPage: navigateToPage,
                ),
        ),
      ),
    );
  }

  void navigateToPage(int index) {
    setState(() {
      _controller.jumpToPage(index);
      selectedIndex = index;
    });
  }
}
