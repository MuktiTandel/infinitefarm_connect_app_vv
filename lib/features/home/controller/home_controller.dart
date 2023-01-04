import 'package:get/get.dart';

class HomeController extends GetxController {

  RxBool isSelect = false.obs;

  RxInt tabIndex = 0.obs ;

  void changeTabIndex(int index) {
    tabIndex(index);
  }
}