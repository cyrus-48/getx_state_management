import 'package:get/get.dart';
import 'package:getx/controllers/store_controller.dart';
import 'package:getx/services/provider.dart';
import 'package:getx/services/repository.dart';

class StoreBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreController(
        repository: ReviewRepository(storeProvider: StoreProvider())));
  }
}