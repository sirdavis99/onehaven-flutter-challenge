import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ride_hailing/domain/entities/hive/user.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/logic/provider/location_provider.dart';
import 'package:ride_hailing/logic/provider/profile.dart';
import 'package:ride_hailing/logic/provider/rides_provider.dart';
import 'package:ride_hailing/presentation/pages/profiles_page.dart';
import 'package:ride_hailing/services/services.dart';
import 'package:ride_hailing/utils/bottom_bar_asset.dart';
import 'package:ride_hailing/utils/color_const.dart';
import 'package:ride_hailing/utils/image_const.dart';
import 'package:ride_hailing/utils/theme.dart';
import '../../utils/hive_const.dart';

class BottomAppBarPage extends ConsumerStatefulWidget {
  const BottomAppBarPage({super.key});

  @override
  ConsumerState<BottomAppBarPage> createState() => _BottomAppBarPageState();
}

class _BottomAppBarPageState extends ConsumerState<BottomAppBarPage> {
  void _getUser() async {
    final httpService = context.read<HttpService>();
    var response = await httpService.user.getUser();
    debugPrint("Response: ${response.data}");
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      ref.watch(getLocationProvider.notifier).getCurrentLocation(context);
      ref.watch(getRideHistoryProvider.notifier).getRideHistory();
      ref.watch(getUserProvider.notifier).getUser();
      ref.watch(getVehicleTypeProvider.notifier).getVehicleTypes();
    });

    debugPrint('Fetching user information');
    _getUser();

    super.initState();
  }

  int currentIndex = 0;

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      child: WillPopScope(
        onWillPop: () async {
          SystemNavigator.pop();
          return false;
        },
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: whiteColor,
          body: Stack(
            children: [
              Positioned(
                child: bottomAppBarPages[currentIndex],
              ),
              if (currentIndex == 0)
                Positioned(
                  top: 58.0.h,
                  left: 20.0.w,
                  child: Container(
                    width: 62.0.w,
                    height: 62.0.h,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(31.0.r),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 66,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 66,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        ),
                        BoxShadow(
                          color: Color(0x19000000),
                          blurRadius: 66,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Material(
                      type: MaterialType.transparency,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(31.0.r),
                        onTap: () {
                          scaffoldKey.currentState!.openDrawer();
                        },
                        child: Center(
                          child: SizedBox(
                            width: 26.0.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 26.0.w,
                                  height: 3.0.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.50),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11.0.h,
                                ),
                                Container(
                                  width: 18.0.w,
                                  height: 3.0.h,
                                  decoration: ShapeDecoration(
                                    color: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(1.50),
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
                ),
            ],
          ),
          drawer: const CustomerDrawerWidget(),
          bottomNavigationBar: SizedBox(
            height: 100.0.h,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor,
              currentIndex: currentIndex,
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: primaryColor,
              unselectedItemColor: blackColor,
              //selectedIconTheme: Theme.of(context).iconTheme.copyWith(color: orangeColor),
              selectedLabelStyle: TextStyle(color: primaryColor),
              unselectedLabelStyle: TextStyle(color: blackColor),
              items: bottomAppBarItem
                  .map(
                    (e) => BottomNavigationBarItem(
                      icon: SvgPicture.asset(
                        e.icon,
                      ),
                      activeIcon: SvgPicture.asset(
                        e.icon,
                        colorFilter:
                            ColorFilter.mode(primaryColor, BlendMode.srcIn),
                      ),
                      label: e.text,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomerDrawerWidget extends StatefulWidget {
  const CustomerDrawerWidget({
    super.key,
  });

  @override
  State<CustomerDrawerWidget> createState() => _CustomerDrawerWidgetState();
}

class _CustomerDrawerWidgetState extends State<CustomerDrawerWidget> {
  var userInfoBox = Hive.box<UserHive>(HiveConst.userInfoBox);
  UserHive? userHive;

  @override
  void initState() {
    super.initState();
    userHive = userInfoBox.get(HiveConst.userInfoKey);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: drawerColor,
      width: 327.0.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100.0.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 21.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60.0.w,
                  height: 60.0.h,
                  decoration: BoxDecoration(
                    color: greyColor,
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(
                  width: 14.0.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${userHive?.firstName} ${userHive?.lastName}",
                      style: semiLargeTextRubik().copyWith(color: whiteColor),
                    ),
                    SizedBox(
                      height: 4.0.h,
                    ),
                    Text(
                      "Edit Profile",
                      style: normalTextRubik().copyWith(color: primaryColor),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 45.0.h,
          ),
          Divider(
            color: dividerColor,
          ),
          SizedBox(
            height: 34.0.h,
          ),
          CustomDrawerBtns(
            svg: postTripIcon,
            text: "Post a Trip",
            onTap: () {
              Navigator.pushNamed(context, RouteGenerator.postTripPage);
            },
          ),
          // CustomDrawerBtns(
          //   svg: communityIcon,
          //   text: "Community",
          // ),
          CustomDrawerBtns(
            svg: activity2Icon,
            text: "Activities",
            onTap: () {
              Navigator.pushNamed(context, RouteGenerator.activityPage,
                  arguments: true);
            },
          ),
          CustomDrawerBtns(
            svg: notification2Icon,
            text: "Notifications",
            onTap: () {
              Navigator.pushNamed(context, RouteGenerator.notificationPage,
                  arguments: true);
            },
          ),
          CustomDrawerBtns(
            svg: faqIcon,
            text: "FAQ",
          ),
          CustomDrawerBtns(
            onTap: () {
              Navigator.pushNamed(context, RouteGenerator.contactUsPage);
            },
            svg: contactIcon,
            text: "Contact Us",
          ),
          CustomDrawerBtns(
            svg: logout2Icon,
            text: "Log out",
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return LogoutDialog();
                },
              );
            },
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 43.0.w),
            child: Text(
              "V 1.0",
              style: mediumTextRubik().copyWith(color: whiteColor),
            ),
          ),
          SizedBox(
            height: 43.0.h,
          )
        ],
      ),
    );
  }
}

class CustomDrawerBtns extends StatelessWidget {
  final String svg;
  final String text;
  final void Function()? onTap;
  const CustomDrawerBtns({
    super.key,
    required this.svg,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 42.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(svg),
                SizedBox(
                  width: 35.0.w,
                ),
                Text(
                  text,
                  style: mediumTextRubik().copyWith(
                    color: whiteColor,
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
