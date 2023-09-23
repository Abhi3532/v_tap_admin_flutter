import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'app.dart';
import '../core/di/Injectable.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  setPathUrlStrategy();
  runApp(App());
}