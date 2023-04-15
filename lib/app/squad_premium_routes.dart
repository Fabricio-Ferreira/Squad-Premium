import 'package:get/route_manager.dart';
import 'package:squad_premium_test/app/pages/home/home_page.dart';
import 'package:squad_premium_test/app/pages/login/login_page.dart';
import 'package:squad_premium_test/app/pages/sign_up/bindings/sign_up_binding.dart';
import 'package:squad_premium_test/app/pages/sign_up/sign_up_page.dart';
import 'package:squad_premium_test/app/pages/splash/splash_page.dart';
import 'package:squad_premium_test/app/routes/app_route_enum.dart';

import 'pages/home/bindings/home_binding.dart';
import 'pages/login/bindings/login_binding.dart';
import 'pages/splash/bindings/splash_binding.dart';

mixin SquadPremiumRoutes {
  static List<GetPage> get routes => [
        GetPage(
          name: AppRoutes.home.path,
          page: HomePage.new,
          bindings: [
            HomeBinding(),
          ],
        ),
        GetPage(
          name: AppRoutes.login.path,
          page: LoginPage.new,
          bindings: [
            LoginBinding(),
          ],
        ),
        GetPage(
          name: AppRoutes.initial.path,
          page: SplashPage.new,
          bindings: [
            SplashBinding(),
          ],
        ),
        GetPage(
          name: AppRoutes.register.path,
          page: SignUpPage.new,
          bindings: [
            SignUpBinding(),
          ],
        ),
      ];
}
