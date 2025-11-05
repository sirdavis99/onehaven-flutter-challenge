import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:onehaven_flutter_challenge/presentation/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  Directory directory = await path.getApplicationSupportDirectory();
  Hive.init(directory.path);

  final prefs = await SharedPreferences.getInstance();
  runApp(App(prefs));
}
