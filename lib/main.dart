import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app/squad_premium_app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded(
    () async {
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (_) {
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
