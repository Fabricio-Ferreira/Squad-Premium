import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:squad_premium_test/app/squad_premium_app_binding.dart';
import 'package:squad_premium_test/app/squad_premium_routes.dart';
import 'package:squad_premium_test/app/utils/widget_utils.dart';

import 'routes/app_route_enum.dart';

class SquadPremiumAppWidget extends StatefulWidget {
  const SquadPremiumAppWidget({Key? key}) : super(key: key);

  @override
  State<SquadPremiumAppWidget> createState() => _SquadPremiumAppWidgetState();
}

class _SquadPremiumAppWidgetState extends State<SquadPremiumAppWidget> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
          statusBarColor: Colors.blue.shade900,
          systemNavigationBarColor: Colors.blue.shade900,
          systemNavigationBarDividerColor: Colors.blue.shade900,
          statusBarIconBrightness: Brightness.light,
        ),
      );
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        navigatorKey: Get.key,
        title: 'Squad Premium',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: AppRoutes.initial.path,
        getPages: SquadPremiumRoutes.routes,
        initialBinding: SquadPremiumAppBinding(),
        builder: (context, child) => Scaffold(
          backgroundColor: Colors.blueGrey.shade50,
          body: GestureDetector(
            onTap: () => WidgetUtils.hideKeyboard(context),
            child: child,
          ),
        ),
      );
}
