import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_images.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_appbar.dart';
import 'package:infinitefarm_connect_app_vv/core/widgets/custom_text.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.of(context).size.width, 55.h),
          child: CustomAppBar(
              backImage: AppImages.backArrow,
              title: 'Events',
              actionTitle: 'Create'
          )
      ),
      body: Padding(
          padding: EdgeInsets.all(20.w),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                const CustomText(text: '0'),
                SizedBox(width: 5.w,),
                const CustomText(text: 'Events')
              ],
            ),
            SizedBox(height: 110.h,),
            SvgPicture.asset(
                AppImages.jobEvent,
              height: 230.h,
              width: 230.w,
            ),
            SizedBox(height: 30.h,),
            CustomText(text: 'Looks like you are not attending any events')
          ],
        ),
      ),
    );
  }
}
