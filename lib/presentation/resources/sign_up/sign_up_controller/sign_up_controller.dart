import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SignUpController extends GetxController {
  RxBool isObsecure = true.obs;
  changeObsecure() {
    isObsecure.value = !isObsecure.value;
  }
}
