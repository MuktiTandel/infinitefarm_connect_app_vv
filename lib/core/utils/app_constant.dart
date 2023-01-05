import 'package:flutter/foundation.dart';

class AppConstant {

  void Debug(String message){
    if(kDebugMode){
      print("***** ${message} *****");
    }
  }

}