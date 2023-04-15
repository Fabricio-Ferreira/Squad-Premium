import 'package:get/get.dart';
import 'package:squad_premium_test/core/di/modules/data_sources_module.dart';
import 'package:squad_premium_test/core/di/modules/repositories_module.dart';
import 'package:squad_premium_test/core/di/modules/use_case_module.dart';

class SquadPremiumAppBinding implements Bindings {
  @override
  void dependencies() {
    DataSourcesModule.init();
    RepositoriesModule.init();
    UseCaseModule.init();
  }
}
