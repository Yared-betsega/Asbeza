import 'package:asbeza/core/common_widgets/custom_snack_bar_content.dart';
import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/core/constants/styles.dart';
import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/widgets/square_tile.dart';
import 'package:asbeza/features/home/presentation/widgets/main_background_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../core/common_widgets/password_input_decoration.dart';
import '../../../../core/common_widgets/text_input_decoration.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showSignupPage;
  const LoginPage({super.key, required this.showSignupPage});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) => {
        if (state is LoginSuccess)
          {
            context.go('/home'),
          }
        else if (state is LoginFailure)
          {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: CustomSnackBarContent(errorText: state.message),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            )
          }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                                "Log In",
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
                          height: 55.h,
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
                                    offset: const Offset(0,
                                        3), // Offset in the x and y directions
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("EMAIL", style: inputLabelTextStyle),
                                      SizedBox(height: 0.5.h),
                                      TextFormField(
                                        controller: _emailController,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                      Text("PASSWORD",
                                          style: inputLabelTextStyle),
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
                                              color: primaryColor),
                                          child: InkWell(
                                            onTap: () {
                                              if (_formKey.currentState!
                                                  .validate()) {
                                                context
                                                    .read<LoginBloc>()
                                                    .add(Login(
                                                      email:
                                                          _emailController.text,
                                                      password:
                                                          _passwordController
                                                              .text,
                                                    ));
                                              }
                                            },
                                            child: Center(
                                                child: BlocBuilder<LoginBloc,
                                                    LoginState>(
                                              builder: (context, state) => (state
                                                      is LoginLoading)
                                                  ? const CircularProgressIndicator(
                                                      color: Colors.white,
                                                    )
                                                  : const Text(
                                                      "Log In",
                                                      style:
                                                          getStartedTextStyle,
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
                                            "Not a member? ",
                                            style: alreadyHaveAccountTextStyle,
                                          ),
                                          MouseRegion(
                                            cursor: SystemMouseCursors.click,
                                            child: TextButton(
                                                onPressed:
                                                    widget.showSignupPage,
                                                child: Text(
                                                  "Register Now",
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
                        SizedBox(
                          height: 20.h,
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 25.0),
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
      ),
    );
  }
}
