import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_24/utils/snackbar.dart';
import 'package:pas1_mobile_11pplg2_24/utils/theme.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/button_widget.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/spinner_widget.dart';

class ProfilePartialPage extends StatelessWidget {
  final UserController userController = Get.find();

  ProfilePartialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => userController.isLoading.value
          ? const Center(
              child: SpinnerWidget(
              color: AppTheme.primaryColor,
              size: SpinnerSize.large,
            ))
          : Stack(
              children: [
                Container(
                  constraints: BoxConstraints(
                    minWidth: Get.width,
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  decoration: const BoxDecoration(
                      color: AppTheme.white100,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                      border: Border.fromBorderSide(
                          BorderSide(color: AppTheme.white80, width: 1.5)),
                      boxShadow: [
                        BoxShadow(
                            color: AppTheme.white80,
                            blurRadius: 12,
                            offset: Offset(0, -3))
                      ]),
                  margin: EdgeInsets.only(top: Get.height / 3),
                  child: Column(
                    children: [
                      ButtonWidget(
                        'Logout', 
                        variant: ButtonVariant.danger, 
                        onPressed: () async {
                          await userController.removeUser();
                          Snackbar.success(message: 'Berhasil logout!');
                          Get.offAllNamed('/login');
                        }
                      ),
                      const SizedBox(height: 16),
                      ButtonWidget(
                        'By Nevan 11 PPLG 2', 
                        variant: ButtonVariant.outline, 
                        onPressed: () {}
                      )
                    ],
                  ),
                ),
                Container(
                  constraints: BoxConstraints(
                    minWidth: Get.width,
                    maxHeight: Get.height / 3,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.person,
                        size: 96,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userController.user.value?.fullName ?? '',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        userController.user.value?.email ?? '',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
