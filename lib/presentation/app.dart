import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ride_hailing/domain/routes/route_selector.dart';
import 'package:ride_hailing/services/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class App extends StatelessWidget {
  final SharedPreferences prefs;

  const App(this.prefs, {super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService(prefs)),
        ProxyProvider<AuthService, HttpService>(
          update: (_, authService, __) => HttpService(authService),
        ),
        ChangeNotifierProvider(create: (_) => UserService()),
      ],
      child: const RouteSelector(),
    );
  }
}
