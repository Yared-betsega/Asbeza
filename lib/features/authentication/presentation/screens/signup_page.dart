import 'package:asbeza/core/common_widgets/custom_snack_bar_content.dart';
import 'package:asbeza/core/constants/colors.dart';
import 'package:asbeza/core/constants/styles.dart';
import 'package:asbeza/features/authentication/presentation/bloc/login/login_bloc.dart';
import 'package:asbeza/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) => {
        if (state is SignupSuccess)
          {
            context.go('/login'),
          }
        else if (state is SignupFailure)
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
        body: SingleChildScrollView(
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width, // Set container width
              height:
                  MediaQuery.of(context).size.height, // Set container height
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover, // Ensure the image covers the container
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8.h),
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
                    "Sign Up",
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
            Padding(
              padding: EdgeInsets.only(top: 18.h),
              child: Center(
                child: Container(
                  width: 86.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), // Shadow color
                        spreadRadius: 10, // Spread radius
                        blurRadius: 20, // Blur radius
                        offset: const Offset(
                            0, 3), // Offset in the x and y directions
                      ),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "NAME",
                            style: TextStyle(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter',
                              color: primaryTextColor,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Brightness.dark,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "EMAIL",
                            style: TextStyle(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter',
                              color: primaryTextColor,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            keyboardAppearance: Brightness.dark,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: primaryColor),
                              ),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            "PASSWORD",
                            style: TextStyle(
                              fontSize: 15.5.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Inter',
                              color: primaryTextColor,
                            ),
                          ),
                          SizedBox(height: 1.h),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: isObscure,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isObscure = !isObscure;
                                  });
                                },
                                icon: Icon(
                                  isObscure
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Material(
                            borderRadius: BorderRadius.circular(50),
                            elevation: 20.0,
                            shadowColor: primaryColor,
                            child: Container(
                              padding: EdgeInsets.all(4.5.w),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: primaryColor,
                              ),
                              child: InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<SignupBloc>().add(SignUp(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          password: _passwordController.text,
                                        ));
                                  }
                                },
                                child: Center(
                                    child: BlocBuilder<SignupBloc, SignupState>(
                                  builder: (context, state) =>
                                      (state is SignupLoading)
                                          ? const CircularProgressIndicator()
                                          : const Text(
                                              "Sign Up",
                                              style: getStartedTextStyle,
                                            ),
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
