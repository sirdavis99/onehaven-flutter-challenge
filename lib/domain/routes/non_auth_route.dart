import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_hailing/domain/routes/route_generator.dart';
import 'package:ride_hailing/theme/app_theme.dart';


class NonAuthRoute extends StatelessWidget {
  const NonAuthRoute({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
    );
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: "OneHaven",
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light(),
          onGenerateRoute: RouteGenerator.nonAuthRoute,
          initialRoute: RouteGenerator.loginPage,
        );
      },
    );
  }
}
