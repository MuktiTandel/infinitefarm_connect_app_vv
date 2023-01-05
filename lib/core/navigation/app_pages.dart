import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_routes.dart';
import 'package:infinitefarm_connect_app_vv/features/events/view/event_group_request_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/events/view/events_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/home/view/home_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/my_jobs/view/my_jobs_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/post/view/post_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/profile/view/profile_screen.dart';

class AppPages {

  static const INITIAL =  AppRoutes.HOME;

  static final routes = [
    GetPage(name: AppRoutes.HOME, page: ()=>  HomeScreen()),
    GetPage(name: AppRoutes.MYJOBS, page: ()=> const MyJobsScreen()),
    GetPage(name: AppRoutes.EVENTS, page: ()=> const EventsScreen()),
    GetPage(name: AppRoutes.POST, page: ()=> PostScreen()),
    GetPage(name: AppRoutes.EVENTGROUPREQUEST, page: ()=>  EventGroupRequestScreen()),
    GetPage(name: AppRoutes.PROFILE, page: ()=> ProfileScreen()),
  ];
}