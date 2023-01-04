import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_pages.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_theme.dart';
import 'package:infinitefarm_connect_app_vv/features/home/view/home_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/my_jobs/view/my_jobs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          theme: AppThemes.dark,
          darkTheme: AppThemes.dark,
          home: HomeScreen(),
        );
      },
    );
  }
}
