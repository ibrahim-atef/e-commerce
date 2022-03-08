import 'package:get/get.dart';
import 'package:testgeo/logic/controlles/main_controller.dart';
import 'package:testgeo/logic/controlles/payment_controller.dart';
import 'package:testgeo/logic/controlles/sitteng_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
    Get.put(SettingController());
    Get.put(PayMentController(), permanent: true);

  }
}