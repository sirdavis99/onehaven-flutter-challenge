import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkedin_login/linkedin_login.dart';
import 'package:ride_hailing/logic/provider/auth_provider.dart';
import 'package:ride_hailing/logic/state/auth_state.dart';
import 'package:ride_hailing/presentation/widgets/custom_btn.dart';
import 'package:ride_hailing/utils/api_const.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import 'login_page.dart';

class JoinPage extends ConsumerStatefulWidget {
  const JoinPage({super.key});

  @override
  ConsumerState<JoinPage> createState() => _JoinPageState();
}

class _JoinPageState extends ConsumerState<JoinPage> {
  //late final AuthCodeObject authorizationCode;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android.
        // Use [light] for white status bar and [dark] for black status bar.
        statusBarIconBrightness: Brightness.dark,
        // For iOS.
        // Use [dark] for white status bar and [light] for black status bar.
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: whiteColor,
        body: Container(
          color: whiteColor,
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                child: SizedBox(
                  height: 675.0.h,
                  width: size.width,
                  child: Image.asset(onboarding4, fit: BoxFit.fill),
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
                      height: 397.0.h,
                      // margin: EdgeInsets.symmetric(horizontal: 33.0.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.0.r),
                          topRight: Radius.circular(40.0.r),
                        ),
                        color: whiteColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 50.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 57.0.w),
                            child: Text(
                              "Lorem Ipsum is sim dummy text of there",
                              textAlign: TextAlign.center,
                              style: largeTextRubik().copyWith(
                                fontWeight: FontWeight.w500,
                                color: boldTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 57.0.w),
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting",
                              textAlign: TextAlign.center,
                              style: mediumTextRubik().copyWith(
                                fontWeight: FontWeight.w300,
                                color: lightTextColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 36.0.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: Consumer(builder: (context, ref, child) {
                              if (ref.watch(mainAuthProvider).isLoading) {
                                return CustomLoadingButton(
                                    size: size, text: "Join in with LinkedIn",);
                              } else {
                                return CustomAssetButton(
                                  backgroundColor: whiteColor,
                                  size: size,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute<void>(
                                        builder: (final BuildContext contexta) =>
                                            LinkedInAuthCodeWidget(
                                          destroySession: false,
                                          redirectUrl: baseUrl + linkedInAuthConst,
                                              //"http://13.51.48.70/api/login-with-linkedin",
                                          clientId: linkedInClientId,
                                          onError:
                                              (final AuthorizationFailedAction
                                                  e) {
                                            if (kDebugMode) {
                                              print('Error: ${e.toString()}');
                                            }
                                            if (kDebugMode) {
                                              print(
                                                  'Error: ${e.stackTrace.toString()}');
                                            }
                                          },
                                          onGetAuthCode:
                                              (final AuthorizationSucceededAction
                                                  response) {
                                            if (kDebugMode) {
                                              print(
                                                  'Auth code ${response.codeResponse.code}');
                                              print(
                                                  'Auth state ${response.codeResponse.state}');
                                            }
                                            ref
                                                .watch(
                                                    mainAuthProvider.notifier)
                                                .auth(
                                                    token: response
                                                        .codeResponse.code!,
                                                    context: context);

                                            if (kDebugMode) {
                                              print(
                                                  'State: ${response.codeResponse.state}');
                                            }
                                            Navigator.pop(contexta);
                                          },
                                        ),
                                        fullscreenDialog: false,
                                      ),
                                    );
                                  },
                                  text: "Join With Linkedin",
                                  textColor: linkedinTextColor,
                                  borderColor: greyColor,
                                  asset: linkedinIcon,
                                );
                              }
                            }),
                          ),
                          SizedBox(
                            height: 36.0.h,
                          ),
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
    );
  }
}
