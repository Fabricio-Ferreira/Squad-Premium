import 'package:get/get.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage.dart';
import 'package:squad_premium_test/core/data/data_sources/local/app_local_storage_impl.dart';

class DataSourcesModule {
  DataSourcesModule._();

  static void init() {
    _injectLocalStorageDataSource();
  }

  static void _injectLocalStorageDataSource() {
    Get.lazyPut<AppLocalStorage>(AppLocalStorageImpl.new);
  }
}
