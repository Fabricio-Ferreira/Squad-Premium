import 'package:get/get.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage_impl.dart';

class LocalModule {
  LocalModule._();

  static void init() {
    Get.put<AppLocalStorage>(AppLocalStorageImpl());
  }
}
