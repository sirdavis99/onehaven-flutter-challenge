import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:onehaven_flutter_challenge/domain/routes/route_selector.dart';
import 'package:onehaven_flutter_challenge/services/auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onehaven_flutter_challenge/logic/provider/member_store.dart';

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
        ChangeNotifierProvider(create: (_) => MemberStore()),
      ],
      child: const RouteSelector(),
    );
  }
}
