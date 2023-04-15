import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController myAnimationController;

  @override
  void initState() {
    super.initState();
    myAnimationController = AnimationController(duration: const Duration(seconds: 4), vsync: this);
    myAnimationController.forward();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        Get.offAllNamed(AppRoutes.login.path);
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: AnimatedBuilder(
              animation: myAnimationController,
              builder: (context, child) => Transform.scale(
                scale: myAnimationController.value * 0.8,
                child: const Image(
                  image: AssetImage('images/icon.jpg'),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<AnimationController>('myAnimationController', myAnimationController));
  }
}
