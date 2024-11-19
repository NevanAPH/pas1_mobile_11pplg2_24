import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/menus_controller.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';

class MobileNavbar extends StatelessWidget {

  final MenusController menu = Get.find();
  final List<List<Object>> menus;
  MobileNavbar(this.menus, {super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        color: AppTheme.backgroundLightColor,
        shape: const CircularNotchedRectangle(),
        height: 80.0,
        notchMargin: 12.0,
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Theme(
          data: ThemeData(splashColor: Colors.transparent),
          child: Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              selectedItemColor: AppTheme.primaryColorLight,
              unselectedItemColor: AppTheme.white30,
              showSelectedLabels: true,
              showUnselectedLabels: false,
              items: menus.map((menu) {
                return BottomNavigationBarItem(
                  icon: Icon(menu[0] as IconData, size: 32),
                  label: menu[1] as String,
                );
                }).toList(),
              currentIndex: menu.selected.value,
              onTap: (index) => menu.selected.value = index,
            ),
          ),
        ),
      );
  }
}