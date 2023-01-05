import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {

  TextEditingController search = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController(text: 'John Smith');
  }
}