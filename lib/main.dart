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
          SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(
              statusBarColor: Colors.red, // Defina a cor desejada aqui
              statusBarIconBrightness:
                  Brightness.light, // Defina a cor dos ícones na barra de status
            ),
          );
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
