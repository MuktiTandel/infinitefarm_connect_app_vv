import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:infinitefarm_connect_app_vv/core/navigation/app_routes.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.height,
    this.width,
    required this.onPresses,
    required this.buttonText,
    this.radius,
    this.fontWeight,
    this.backgroundColor,
    this.textColor
  }) : super(key: key);

  final double? height;
  final double? width;
  final VoidCallback onPresses;
  final String buttonText;
  final double? radius;
  final FontWeight? fontWeight;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h,
      width: width ?? MediaQuery.of(context).size.width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
               shadowColor: Colors.transparent,
               backgroundColor: backgroundColor ?? AppColors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius ?? 16)
              )
          ),
          onPressed: (){
            onPresses();
          },
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Archia',
              color: textColor ?? Colors.white,
              fontWeight: fontWeight ?? FontWeight.w500
            ),
          )
      ),
    );
  }
}
