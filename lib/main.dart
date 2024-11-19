import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/utils/routes.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PAS Mobile Nevan 11 PPLG 2 24',
      theme: AppTheme.getThemeData(),
      initialRoute: '/',
      getPages: routes,
    );
  }
}
