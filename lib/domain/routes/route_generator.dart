import 'package:flutter/material.dart';
import 'package:ride_hailing/presentation/pages/login_page.dart';
import 'package:ride_hailing/presentation/pages/dashboard_page.dart';
import 'package:ride_hailing/presentation/pages/member_detail_page.dart';
import 'package:ride_hailing/domain/members/member.dart';

class RouteGenerator {
  static const loginPage = "/loginPage";
  static const dashboardPage = "/dashboard";
  static const memberDetailPage = "/memberDetail";

  static Route<dynamic> nonAuthRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginPage:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      default:
        return MaterialPageRoute(builder: (_) => const LoginPage());
    }
  }

  ///Auth Route
  static Route<dynamic> authRoute(RouteSettings settings) {
    switch (settings.name) {
      case dashboardPage:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case memberDetailPage:
        return MaterialPageRoute(
          builder: (_) => MemberDetailPage(
            member: settings.arguments as Member,
          ),
        );
      default:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
    }
  }
}
