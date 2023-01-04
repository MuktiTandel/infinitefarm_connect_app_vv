import 'package:flutter/material.dart';
import 'package:infinitefarm_connect_app_vv/core/utils/app_colors.dart';

class AppThemes {

  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: AppColors.dark_theme
  );

}