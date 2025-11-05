import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/presentation/widgets/custom_text_field.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:ride_hailing/services/auth_service.dart';
import 'package:ride_hailing/stores/auth/model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.light,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          width: size.width,
          height: size.height,
          color: whiteColor,
          child: Stack(
            children: [
              Positioned(
                  top: 0.0,
                  child: SizedBox(
                    height: 306.0.h,
                    width: size.width,
                    child: Image.asset(joinHeader, fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                left: 0.0,
                right: 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BottomSheetTopWidget(size: size),
                         Container(
                      width: size.width,
                      height: 679.0.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0.r),
                          topRight: Radius.circular(40.0.r),
                        ),
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 20.0.w),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50.0.h,
                              ),
                              Text(
                                "Welcome Back",
                                textAlign: TextAlign.center,
                                style: largeTextRubik().copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: boldTextColor,
                                ),
                              ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Text(
                                  "Enter your detaills below",
                                  textAlign: TextAlign.center,
                                  style: mediumTextRubik().copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: lightTextColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 24.0.h,
                                ),
                                CustomTextField(
                                  label: "Email Address",
                                  controller: _emailController,
                                  textInputType: TextInputType.emailAddress,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) return "Email is required";
                                    final re = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
                                    if (!re.hasMatch(v)) return "Enter a valid email";
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 25.0.h,
                                ),
                                CustomTextField(
                                  label: "Password",
                                  controller: _passwordController,
                                  obscureText: true,
                                  validator: (v) {
                                    if (v == null || v.isEmpty) return "Password is required";
                                    if (v.length < 6) return "Min 6 characters";
                                    return null;
                                  },
                                  suffixIcon: SvgPicture.asset(hidePassword, fit: BoxFit.scaleDown,),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: (){

                                      }, 
                                      child: Text("Forgot password", style: normalTextRubik(),))
                                  ],
                                ),
                                // SizedBox(
                                //   height: 20.0.h,
                                // ),
                                CustomButton(
                                  size: size,
                                  onTap: () {
                                    final form = _formKey.currentState;
                                    if (form != null && form.validate()) {
                                      context.read<AuthService>().setAuth(
                                            AuthModel(token: 'mock-token'),
                                          );
                                    }
                                  },
                                  text: "Log in",
                                ),
                                SizedBox(
                                  height: 10.0.h,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: TextButton(
                                    onPressed: (){},
                                    child: RichText(
                                      text: TextSpan(
                                        text: "Don't have an account? ",
                                        style: normalTextRubik().copyWith(
                                          color: lightTextColor,
                                          fontWeight: FontWeight.w300,
                                        ),
                                        children: [
                                          TextSpan(
                                            text: "Sign Up",
                                            style: normalTextRubik().copyWith(
                                              color: primaryColor,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30.0.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 142.0.h,
                                      child: Divider(
                                        thickness: 1.0.h,
                                        color: greyColor1,
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 6.0.h),
                                      child: Text("Or sign in with", style: smallTextRubik().copyWith(fontWeight: FontWeight.w400),),
                                    ),
                                    SizedBox(
                                      width: 142.0.h,
                                      child: Divider(
                                        thickness: 1.0.h,
                                         color: greyColor1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 52.0.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GoogleBtn(size: size),
                                    SizedBox(
                                      width: 15.0.w,
                                    ),
                                    LinkedinBtn(size: size)
                                  ],
                                ),

                          ],
                        ),
                      ),
                         ),
                    ],
                  )
                
                )
            ],
          ),
        )
      ),
    );
  }
}

class LinkedinBtn extends StatelessWidget {
  const LinkedinBtn({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          height: 64.0.h,
          width: size.width,
          decoration: BoxDecoration(
            color: whiteColor,
            border: Border.all(
              color: lightBorderColor,
            ),
            borderRadius:
                BorderRadius.circular(11.0),
          ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: (){},
               borderRadius: BorderRadius.circular(11.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(linkedinIcon),
                  SizedBox(
                    width: 11.0.w,
                  ),
                  Text(
                    "Linkedin",
                    style:
                        mediumTextRubik().copyWith(
                      color: linkedinTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),),
    );
  }
}

class GoogleBtn extends StatelessWidget {
  const GoogleBtn({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 64.0.h,
        width: size.width,
        decoration: BoxDecoration(
          color: whiteColor,
          border: Border.all(
            color: lightBorderColor,
            
          ),
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {},
              borderRadius: BorderRadius.circular(11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(googleIcon),
                SizedBox(
                  width: 11.0.w,
                ),
                Text("Google", style: mediumTextRubik().copyWith(color: googleTextColor,),),
              ],
            ),
          ),
        )
      ),
    );
  }
}

class BottomSheetTopWidget extends StatelessWidget {
  const BottomSheetTopWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        height: 15.0.h,
        margin: EdgeInsets.symmetric(horizontal: 33.0.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0.r),
            topRight: Radius.circular(25.0.r),
          ),
          color: whiteColor.withOpacity(0.4),
        ),
      );
  }
}
