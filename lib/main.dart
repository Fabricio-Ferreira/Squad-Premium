import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/squad_premium_app_widget.dart';
import 'init_core_modules.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded(
    () async {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (_) async {
          await initCoreModules();
          runApp(const SquadPremiumAppWidget());
        },
      );
    },
    (error, stackTrace) {
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
    },
  );
}
