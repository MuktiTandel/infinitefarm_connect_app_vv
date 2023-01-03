import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_routes.dart';
import 'package:infinitefarm_connect_app_vv/features/events/view/events_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/my_jobs/view/my_jobs_screen.dart';

class AppPages {

  static const INITIAL =  AppRoutes.MYJOBS;

  static final routes = [
    GetPage(name: AppRoutes.MYJOBS, page: ()=> const MyJobsScreen()),
    GetPage(name: AppRoutes.EVENTS, page: ()=> const EventsScreen())
  ];
}