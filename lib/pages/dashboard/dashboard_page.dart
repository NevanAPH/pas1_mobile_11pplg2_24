import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_24/pages/dashboard/menus/favorite_partial.dart';
import 'package:pas1_mobile_11pplg2_24/pages/dashboard/menus/home_partial.dart';
import 'package:pas1_mobile_11pplg2_24/pages/dashboard/menus/profile_partial.dart';
import 'package:pas1_mobile_11pplg2_24/utils/snackbar.dart';

import 'package:pas1_mobile_11pplg2_24/controllers/menus_controller.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/mobile_navbar.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  
  final controller = PageController();
  final MenusController menu = Get.find();
  final UserController userController = Get.find();

  final List<Widget> _pages = [
    HomePartialPage(),
    FavoritePartialPage(),
    ProfilePartialPage(),
  ];

  final _menus = [
    [Icons.home, 'Home'],
    [Icons.favorite, 'Favorite'],
    [Icons.person, 'Profile'],
  ];

  @override
  Widget build(BuildContext context) {
    checkUser();
    menu.selected.listen((value) {
      if (menu.locked.value) return;
      controller.animateToPage(value,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeOutCirc);
    });

    controller.addListener(() {
      menu.locked.value = true;
      menu.selected.value = controller.page!.round();
      menu.locked.value = false;
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset('assets/images/backgrounds/main.png',
              width: Get.width, fit: BoxFit.cover),
          PageView(
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ],
      ),

      // create bottom navigation bar
      bottomNavigationBar: MobileNavbar(_menus),
    );
  }

  void checkUser() async  {
    try {
      await userController.getUser();
    } on Exception catch (e) {
      Snackbar.error(message: e.toString());
    }
  }
}
