import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ride_hailing/domain/entities/hive/auth_state.dart';
import 'package:ride_hailing/domain/entities/hive/user.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/presentation/widgets/account/delete_account_modal.dart';
import 'package:ride_hailing/services/services.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/hive_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';

class ProfilesPage extends StatefulWidget {
  const ProfilesPage({super.key});

  @override
  State<ProfilesPage> createState() => _ProfilesPageState();
}

class _ProfilesPageState extends State<ProfilesPage> {
  var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);

  UserHive? userHive;

  _openDeactivateAccountDialog() {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return DeleteAccountModal(
          onSuccess: () => Navigator.pop(context),
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  _getUserInfo() async {
    final httpService = context.read<HttpService>();

    var response = await httpService.user.getUser();
    debugPrint("${response.data}");
  }

  @override
  void initState() {
    super.initState();
    userHive = userInfoBox.get(HiveConst.userInfoKey);

    _getUserInfo();
  }

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
        backgroundColor: whiteColor1,
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 50.0.w,
                    ),
                    Text(
                      "Profile",
                      style: normalTextRubik().copyWith(
                          color: blackColor, fontWeight: FontWeight.w100),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteGenerator.editPage);
                      },
                      icon: SvgPicture.asset(editIcon),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.0.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 87.0.w,
                    height: 87.0.h,
                    decoration: BoxDecoration(
                      color: greyColor2,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 14.0.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${userHive?.firstName} ${userHive?.lastName}",
                        style: semiLargeTextRubik().copyWith(
                          color: blackColor,
                        ),
                      ),
                      SizedBox(
                        height: 4.0.h,
                      ),
                      Text(
                        userHive!.phoneNumber ?? "...",
                        style: normalTextRubik().copyWith(
                          color: blackColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: 9.0.h,
                      ),
                      Container(
                        width: 44.0.w,
                        height: 22.0.h,
                        decoration: BoxDecoration(
                          color: greyColor4,
                          borderRadius: BorderRadius.circular(7.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 12.w,
                              height: 12.h,
                              decoration: const ShapeDecoration(
                                color: Color(0xFF3071F5),
                                shape: StarBorder(
                                  points: 5,
                                  innerRadiusRatio: 0.38,
                                  pointRounding: 0,
                                  valleyRounding: 0,
                                  rotation: 0,
                                  squash: 0,
                                ),
                              ),
                            ),
                            Text(
                              "5.0",
                              style: normalTextRubik().copyWith(
                                  color: blackColor,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.0.h,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 21.0.w),
                  width: size.width,
                  height: 90.0.h,
                  decoration: BoxDecoration(
                    color: whiteColor2,
                    borderRadius: BorderRadius.circular(12.0.r),
                    border: Border.all(
                      color: greenColor,
                      width: 0.25,
                    ),
                  ),
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0.r),
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.securitySettingPage);
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Security Settings',
                                  style: mediumTextRubik()
                                      .copyWith(color: blackColor),
                                ),
                                SizedBox(
                                  height: 4.0.h,
                                ),
                                Text(
                                  'Turn on your security settings incase\nof emergencies',
                                  style: smallTextRubik().copyWith(
                                    color: blackColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                )
                              ],
                            ),
                            SvgPicture.asset(securitySettingIcon)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 24.0.h,
                ),
                Container(
                  height: 6.0.h,
                  width: size.width,
                  color: whiteColor4,
                ),
                SizedBox(
                  height: 34.0.h,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 22.0.w),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Favorite Locations",
                //         style: smallTextRubik().copyWith(
                //           color: blackColor,
                //           fontWeight: FontWeight.w700,
                //         ),
                //       ),
                //       Material(
                //         type: MaterialType.transparency,
                //         child: InkWell(
                //           onTap: () {},
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: 14.0.h,
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   SvgPicture.asset(
                //                     homeAddressIcon,
                //                   ),
                //                   SizedBox(
                //                     width: 23.0.w,
                //                   ),
                //                   Column(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         "Home",
                //                         style: smallTextRubik().copyWith(
                //                           color: blackColor,
                //                           fontWeight: FontWeight.w200,
                //                         ),
                //                       ),
                //                       Text(
                //                         "34a Ago Iwoye Street, Ikorodu, Lagos.",
                //                         style: normalTextRubik()
                //                             .copyWith(color: whiteColor5),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 14.0.h,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Divider(
                //         color: dividerColor,
                //       ),
                //       Material(
                //         type: MaterialType.transparency,
                //         child: InkWell(
                //           onTap: () {},
                //           child: Column(
                //             children: [
                //               SizedBox(
                //                 height: 14.0.h,
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   SvgPicture.asset(
                //                     officeAddressIcon,
                //                   ),
                //                   SizedBox(
                //                     width: 23.0.w,
                //                   ),
                //                   Column(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Text(
                //                         "Office",
                //                         style: smallTextRubik().copyWith(
                //                           color: blackColor,
                //                           fontWeight: FontWeight.w200,
                //                         ),
                //                       ),
                //                       Text(
                //                         "34a Ago Iwoye Street, Ikorodu, Lagos.",
                //                         style: normalTextRubik()
                //                             .copyWith(color: whiteColor5),
                //                       ),
                //                     ],
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 14.0.h,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //       Divider(
                //         color: dividerColor,
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 34.0.h,
                // ),
                // Container(
                //   height: 6.0.h,
                //   width: size.width,
                //   color: whiteColor4,
                // ),
                // SizedBox(
                //   height: 10.0.h,
                // ),
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return LogoutDialog();
                        },
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(logoutIcon),
                              SizedBox(
                                width: 22.0.w,
                              ),
                              Text(
                                "Log out",
                                style: mediumTextRubik().copyWith(
                                  color: whiteColor5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 14.0.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                  child: Divider(
                    color: dividerColor,
                  ),
                ),
                Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: _openDeactivateAccountDialog,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 14.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(deleteIcon),
                              SizedBox(
                                width: 22.0.w,
                              ),
                              Text(
                                "Delete Account",
                                style: mediumTextRubik().copyWith(
                                  color: whiteColor5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.0.h,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 80.0.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class LogoutDialog extends StatelessWidget {
  LogoutDialog({
    super.key,
  });

  var userIdBox = Hive.box<String>(HiveConst.useridBox);
  var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);
  final authBox = Hive.box<AuthStateHive>(HiveConst.authStateBox);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Logout'),
      content: const Text('Do you really want to logout?'),
      actions: [
        MaterialButton(
          textColor: primaryColor,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
        MaterialButton(
          textColor: primaryColor,
          onPressed: () {
            userIdBox.clear();
            userInfoBox.clear();
            authBox.clear();
          },
          child: const Text('YES'),
        ),
      ],
    );
  }
}
