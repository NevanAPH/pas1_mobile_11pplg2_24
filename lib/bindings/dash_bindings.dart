// create getx binding
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/menus_controller.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/user_controller.dart';

class DashBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserController());
    Get.lazyPut(() => MenusController());
  }
}