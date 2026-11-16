import 'package:flutter/material.dart';

import 'config/theme/theme_manager.dart';
import 'core/prefs_manager/prefs_manager.dart';
import 'core/resources/routes_manager.dart';
import 'core/resources/strings_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(const BrightStepsApp());
}

class BrightStepsApp extends StatelessWidget {
  const BrightStepsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsManager.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.light,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
