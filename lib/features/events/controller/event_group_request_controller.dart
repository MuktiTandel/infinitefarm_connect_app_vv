import 'package:get/get.dart';

class EventGroupRequestController extends GetxController {

  RxBool isGroup = false.obs;

  RxBool isRequest = true.obs;

  void selectGroup() {
    if(isGroup.value == false) {
      isRequest(!isRequest.value);
      isGroup(!isGroup.value);
    }
  }

  void selectRequest () {
      if(isRequest.value == false) {
        isRequest(!isRequest.value);
        isGroup(!isGroup.value);
      }
  }
}