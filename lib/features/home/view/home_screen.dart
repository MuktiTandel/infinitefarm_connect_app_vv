import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_routes.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/features/home/controller/home_controller.dart';
import 'package:infinitefarm_connect_app_vv/features/home/view/main_home_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/my_jobs/view/job_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/my_network/view/my_network_screen.dart';
import 'package:infinitefarm_connect_app_vv/features/notification/view/notification_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

   final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppImages.darkBackground),
            fit: BoxFit.cover,
            opacity: 0.8
          )
        ),
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.only(
                left: 15.w,
                right: 15.w,
                top: 10.h
              ),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      maxRadius: 26.w,
                       child: Image.asset(AppImages.profile),
                    ),
                    SizedBox(
                      width: 220.w,
                        child: TextFormField(
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none
                            ),
                            fillColor: Colors.white.withOpacity(0.05),
                            filled: true,
                            prefixIcon: Padding(
                              padding:  EdgeInsets.all(12.w),
                              child: SvgPicture.asset(
                                  AppImages.search,
                                width: 5.w,
                                height: 5.h,
                                fit: BoxFit.cover,
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Colors.white.withOpacity(0.3),
                              fontFamily: 'Archia'
                            )
                          ),
                        )
                    ),
                    GestureDetector(
                      onTap: (){},
                      child: SvgPicture.asset(
                          AppImages.message,
                        height: 23.h,
                        width: 23.w,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18.h,),
                Obx(() => Expanded(
                  child: IndexedStack(
                    index: homeController.tabIndex.value,
                    children: const [
                      MainHomeScreen(),
                      MyNetworkScreen(),
                      NotificationScreen(),
                      JobScreen(),
                    ],
                  ),
                ))
              ],
            ),
          ),
        )
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        shape: const CircularNotchedRectangle(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 70.h,
          decoration: BoxDecoration(
              color: AppColors.bottomSheet,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomItem(AppImages.home, 'Home', 0),
              bottomItem(AppImages.myNetwork, 'My Network', 1),
              SizedBox(width: 20.w,),
              bottomItem(AppImages.notification, 'Notifications', 2),
              bottomItem(AppImages.job, 'Jobs', 3),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 55.h,
        width: 55.w,
        child: Visibility(
          visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
          child: FittedBox(
            child: FloatingActionButton(
              shape: const StadiumBorder(
                side: BorderSide(
                  color: Colors.white, width: 2
                )
              ),
                onPressed: (){
                  Get.toNamed(AppRoutes.POST);
                },
              backgroundColor: AppColors.blue,
              child: Icon(
                  Icons.add,
                color: Colors.white,
                size: 30.w,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomItem(String image, String title, int index) {
    return Obx(() => GestureDetector(
      onTap: (){
        homeController.changeTabIndex(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: SizedBox(height: 7.h,)),
          SvgPicture.asset(
            image,
            height: 20.h,
            width: 20.w,
            color: homeController.tabIndex.value == index
                ? Colors.white
                : Colors.white.withOpacity(0.6),
          ),
          SizedBox(height: 4.h,),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Archia',
              color: homeController.tabIndex.value == index
                  ? Colors.white
                  : Colors.white.withOpacity(0.6),
            ),
          ),
          Expanded(child: SizedBox(height: 1.h,)),
          homeController.tabIndex.value != index ? SizedBox(
            height: 5.h,
            width: 60.w,
          ) : Container(
            height: 5.h,
            width: 60.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                topLeft: Radius.circular(12)
              ),
              color: Colors.white
            ),
          )
        ],
      ),
    ));
  }
}
