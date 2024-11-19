import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/bindings/dash_bindings.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_24/pages/auth/login_page.dart';
import 'package:pas1_mobile_11pplg2_24/pages/dashboard/dashboard_page.dart';
import 'package:pas1_mobile_11pplg2_24/pages/details/detail_page.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';

final List<GetPage> routes = [
  GetPage(
    name: '/',
    page: () {
      final UserController authController = Get.put(UserController());
      authController.getUser().then((e) {
        if (e == null) {
          Get.offAllNamed('/login');
        } else {
          Get.offAllNamed('/dashboard');
        }
      });
      return Container(decoration: const BoxDecoration(color: AppTheme.backgroundColor));
    },
  ),
  GetPage(
    name: '/login',
    page: () => LoginPage(),
  ),
  GetPage(
    name: '/dashboard',
    page: () => DashboardPage(),
    binding: DashBindings()
  ),
  GetPage(
    name: '/detail',
    page: () => const DetailPage()
  )
];