import 'package:asbeza/asbeza.dart';

class DebtScreen extends StatefulWidget {
  const DebtScreen({
    super.key,
  });

  @override
  State<DebtScreen> createState() => _DebtScreenState();
}

class _DebtScreenState extends State<DebtScreen> {
  bool isObscure = true;
  final List<Map<String, dynamic>> foodList = FoodData.foodList;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (BuildContext context, HomeState state) {},
      builder: (BuildContext context, HomeState state) => state is HomeSuccess
          ? Stack(
              children: [
                const MainBackground(),
                Padding(
                  padding: EdgeInsets.only(
                    top: 6.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            GreetingContent(),
                            Center(
                              child: Material(
                                elevation: 20,
                                shadowColor: primaryColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                child: Container(
                                  width: 88.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    color: getStartedButtonColor2,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.w),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  isObscure = !isObscure;
                                                });
                                              },
                                              icon: Icon(
                                                isObscure
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            CustomRectangularCard(
                                              isObscure: isObscure,
                                              name: "Debt",
                                              amount: '\$${state.profile.debt}',
                                              icon: Icons.arrow_upward,
                                            ),
                                            CustomRectangularCard(
                                              isObscure: isObscure,
                                              name: "Credit",
                                              amount:
                                                  '\$${state.profile.credit}',
                                              icon: Icons.arrow_downward,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Debt & Credit History",
                                      style: TextStyle(
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.sp),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        context.go('/home/debtHistoryDetails');
                                      },
                                      child: Text(
                                        "See all",
                                        style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.sp),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              BlocBuilder<HomeBloc, HomeState>(
                                builder: (context, state) {
                                  final debtTransactions = [];

                                  if (state is HomeSuccess) {
                                    for (var e in state.profile.transactions) {
                                      if (e.category == "debt") {
                                        debtTransactions.add(e);
                                      }
                                    }
                                  }

                                  return Expanded(
                                    flex: 5,
                                    child: SizedBox(
                                      child: ListView.builder(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 1.w, vertical: 0),
                                          itemCount: debtTransactions.length,
                                          itemBuilder: (BuildContext context,
                                                  int index) =>
                                              state is HomeSuccess
                                                  ? CustomListTile(
                                                      transaction: state.profile
                                                              .transactions[
                                                          index % 4])
                                                  : null
                                          // CustomListTile(
                                          //     transaction: foodList[index % 4]),

                                          ),
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          : const ShimmerLoading(),
    );
  }
}
