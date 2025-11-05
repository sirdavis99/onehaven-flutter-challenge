import 'package:flutter/material.dart';
import 'package:ride_hailing/presentation/pages/home_page.dart';
import 'package:ride_hailing/presentation/pages/notification_page.dart';
import 'package:ride_hailing/presentation/pages/profiles_page.dart';
import 'package:ride_hailing/utils/image_const.dart';

import '../presentation/pages/activities_page.dart';

List<Widget> bottomAppBarPages = [
  const HomePage(),
  const ActivitiesPage(backButton:  false,),
  const NotificationPage(backButton: false,),
  const ProfilesPage(),
 
];

class BottomAppBarItemEntities {
  final String icon;
  final String text;

  BottomAppBarItemEntities({required this.icon, required this.text});
}

List<BottomAppBarItemEntities> bottomAppBarItem = [
  BottomAppBarItemEntities(icon: homeIcon, text: "Home"),
  BottomAppBarItemEntities(icon: activityIcon, text: "Activities"),
  BottomAppBarItemEntities(icon: notificationIcon, text: "Notification"),
  BottomAppBarItemEntities(icon: profileIcon, text: "Profile"),
];
