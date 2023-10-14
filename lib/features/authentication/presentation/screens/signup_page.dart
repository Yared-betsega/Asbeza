import 'package:asbeza/asbeza.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback showLoginPage;
  const SignupPage({super.key, required this.showLoginPage});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Stack(
              fit: StackFit.expand,
              children: [
                const MainBackground(),
                Padding(
                  padding: EdgeInsets.only(top: 6.h),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 10.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.white,
                                size: 5.w,
                              ),
                              onPressed: () {
                                context.go('/onboardingPage');
                              },
                            ),
                            const Text(
                              "Register",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.more_horiz_sharp,
                                color: Colors.white,
                                size: 10.w,
                              ),
                              onPressed: () {
                                // Add your menu button logic here
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 63.h,
                        child: Center(
                          child: Container(
                            width: 86.w,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey
                                      .withOpacity(0.1), // Shadow color
                                  spreadRadius: 10, // Spread radius
                                  blurRadius: 20, // Blur radius
                                  offset: const Offset(
                                      0, 3), // Offset in the x and y directions
                                ),
                              ],
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5.w, vertical: 4.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("EMAIL", style: inputLabelTextStyle),
                                    SizedBox(height: 0.5.h),
                                    TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      keyboardAppearance: Brightness.dark,
                                      decoration: textInputDecoration(),
                                      validator: (value) {
                                        if (!RegExp(
                                                r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                                            .hasMatch(value!)) {
                                          return 'Please enter a valid email address';
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(height: 2.h),
                                    Text(
                                      "PASSWORD",
                                      style: inputLabelTextStyle,
                                    ),
                                    SizedBox(height: 0.5.h),
                                    TextFormField(
                                      controller: _passwordController,
                                      obscureText: isObscure,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: passwordInputDecoration(
                                          isObscure: isObscure,
                                          onPressed: () {
                                            setState(() {
                                              isObscure = !isObscure;
                                            });
                                          }),
                                    ),
                                    SizedBox(height: 1.h),
                                    Text(
                                      "CONFIRM PASSWORD",
                                      style: inputLabelTextStyle,
                                    ),
                                    SizedBox(height: 0.5.h),
                                    TextFormField(
                                      controller: _confirmPasswordController,
                                      obscureText: isObscure,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      decoration: passwordInputDecoration(
                                          isObscure: isObscure,
                                          onPressed: () {
                                            setState(() {
                                              isObscure = !isObscure;
                                            });
                                          }),
                                      validator: (value) {
                                        if (value! !=
                                            _passwordController.text) {
                                          return "Passwords doesn't match";
                                        }
                                        return null;
                                      },
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
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: primaryColor,
                                        ),
                                        child: InkWell(
                                          onTap: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              context
                                                  .read<SignupBloc>()
                                                  .add(SignUp(
                                                    email:
                                                        _emailController.text,
                                                    password:
                                                        _passwordController
                                                            .text,
                                                  ));
                                            }
                                          },
                                          child: Center(
                                              child: BlocBuilder<SignupBloc,
                                                  SignupState>(
                                            builder: (context, state) => (state
                                                    is SignupLoading)
                                                ? const CircularProgressIndicator()
                                                : const Text(
                                                    "Sign Up",
                                                    style: getStartedTextStyle,
                                                  ),
                                          )),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text(
                                          "Already Have Account? ",
                                          style: alreadyHaveAccountTextStyle,
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: TextButton(
                                              onPressed: widget.showLoginPage,
                                              child: Text(
                                                "Log In",
                                                style: loginTextStyle,
                                              )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      SizedBox(
                        height: 20.h,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "Or continue with",
                                      style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    thickness: 0.5,
                                    color: Colors.grey[400],
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SquareTile(
                                    imagePath: 'assets/images/google.png',
                                    onTap: () {
                                      BlocProvider.of<LoginBloc>(context)
                                          .add(LoginWithGoogle());
                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
