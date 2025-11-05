import 'package:flutter/material.dart';
import 'package:ride_hailing/presentation/pages/activities_page.dart';
import 'package:ride_hailing/presentation/pages/contact_us.dart';
import 'package:ride_hailing/presentation/pages/driver_add_location.dart';
import 'package:ride_hailing/presentation/pages/edit_profile.dart';
import 'package:ride_hailing/presentation/pages/join_page.dart';
import 'package:ride_hailing/presentation/pages/login_page.dart';
import 'package:ride_hailing/presentation/pages/message_us_page.dart';
import 'package:ride_hailing/presentation/pages/notification_page.dart';
import 'package:ride_hailing/presentation/pages/onboarding.dart';
import 'package:ride_hailing/presentation/pages/post_trip.dart';
import 'package:ride_hailing/presentation/pages/success_screen.dart';
import 'package:ride_hailing/presentation/pages/support_chat_page.dart';

import '../../presentation/pages/bottom_bar.dart';
import '../../presentation/pages/driver_kyc_page.dart';
import '../../presentation/pages/security_setting.dart';

class RouteGenerator {
  static const onboardingPage = "/";
  static const joinPage = "/joinPage";
  static const loginPage = "/loginPage";
  static const bottomBarPage = "/bottomBarPage";
  static const editPage = "/editPage";
  static const securitySettingPage = "/securitySettingPage";
  static const postTripPage = "/postTripPage";
  static const contactUsPage = "/contactUsPage";
  static const messageUsPage = "/messageUsPage";
  static const supportChatPage = "/supportChatPage";
  static const driverAddLocation = "/driverAddLocation";
  static const activityPage = "/activityPage";
  static const notificationPage = "/notificationPage";
  static const successPage = "/successPage";
  static const driverKycPage = "/driverKycPage";

  static Route<dynamic> nonAuthRoute(RouteSettings settings) {
    switch (settings.name) {
      case onboardingPage:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case joinPage:
        return MaterialPageRoute(builder: (_) => const JoinPage());
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      default:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
  }

  ///Auth Route

  static Route<dynamic> authRoute(RouteSettings settings) {
    switch (settings.name) {
      case bottomBarPage:
        return MaterialPageRoute(builder: (_) => const BottomAppBarPage());
      case editPage:
        return MaterialPageRoute(
            builder: (_) => EditProfile(
                  route: settings.arguments as String?,
                ));
      case securitySettingPage:
        return MaterialPageRoute(builder: (_) => const SecuritySettings());
      case postTripPage:
        return MaterialPageRoute(builder: (_) => const PostTrip());
      case contactUsPage:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case messageUsPage:
        return MaterialPageRoute(builder: (_) => const MessageUsPage());
      case supportChatPage:
        return MaterialPageRoute(builder: (_) => const SupportChatPage());
      case driverAddLocation:
        return MaterialPageRoute(builder: (_) => const DriverAddLocation());
      case activityPage:
        return MaterialPageRoute(
          builder: (_) => ActivitiesPage(
            backButton: settings.arguments as bool,
          ),
        );
      case notificationPage:
        return MaterialPageRoute(
          builder: (_) => NotificationPage(
            backButton: settings.arguments as bool,
          ),
        );
      case successPage:
        return MaterialPageRoute(
          builder: (_) =>  SuccessScreen(
            text: settings.arguments as String?,
          ),
        );
      case driverKycPage:
        return MaterialPageRoute(
          builder: (_) => DriverKycPage(
            route: settings.arguments as String?,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
    }
  }
}
