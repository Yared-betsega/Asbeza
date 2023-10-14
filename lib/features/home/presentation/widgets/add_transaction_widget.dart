import 'package:asbeza/asbeza.dart';

class AddTransaction extends StatefulWidget {
  const AddTransaction({
    super.key,
    required GlobalKey<FormState> formKey,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  String selectedValue = "Food";
  bool isSpending = true;
  final TextEditingController _reasonController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  void toogleIsSpending(bool value) {
    setState(() {
      isSpending = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 75.h,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5.h),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Form(
          key: widget._formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("CATEGORY", style: inputLabelTextStyle),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(5)),
                          child: DropdownButton<String?>(
                            value: selectedValue,
                            items: ["Food", "Debt", "Cloth"]
                                .map<DropdownMenuItem<String?>>(
                                    (e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(e.toString()),
                                        ))
                                .toList(),
                            underline: const SizedBox(),
                            isExpanded: true,
                            onChanged: (String? value) {
                              setState(() {
                                selectedValue = value!;
                              });
                            },
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text("AMOUNT", style: inputLabelTextStyle),
                        SizedBox(height: 0.5.h),
                        TextFormField(
                          controller: _amountController,
                          keyboardAppearance: Brightness.dark,
                          decoration: textInputDecoration(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a valid amount ';
                            }
                            try {
                              int.parse(value);
                            } catch (e) {
                              return 'Please enter a valid number';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 2.h),
                        Text("REASON", style: inputLabelTextStyle),
                        SizedBox(height: 0.5.h),
                        TextFormField(
                          controller: _reasonController,
                          keyboardType: TextInputType.emailAddress,
                          keyboardAppearance: Brightness.dark,
                          decoration: textInputDecoration(),
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () => toogleIsSpending(true),
                              child: Container(
                                width: 25.w,
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                    color: isSpending
                                        ? primaryColor
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Income",
                                    style: TextStyle(
                                        color: isSpending
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: "Inter"),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => toogleIsSpending(false),
                              child: Container(
                                width: 25.w,
                                padding: EdgeInsets.all(3.w),
                                decoration: BoxDecoration(
                                    color: !isSpending
                                        ? primaryColor
                                        : Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    "Expense",
                                    style: TextStyle(
                                        color: !isSpending
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 16.sp,
                                        fontFamily: "Inter"),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Material(
                          borderRadius: BorderRadius.circular(50),
                          elevation: 20.0,
                          shadowColor: primaryColor,
                          child: Container(
                            padding: EdgeInsets.all(4.5.w),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: primaryColor),
                            child: InkWell(
                              onTap: () {
                                if (widget._formKey.currentState!.validate()) {}
                              },
                              child: const Center(
                                  child: Text(
                                "Confirm",
                                style: getStartedTextStyle,
                              )),
                            ),
                          ),
                        ),
                        SizedBox(height: 4.h),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
