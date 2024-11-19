import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/apis/api.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/auth_controller.dart';
import 'package:pas1_mobile_11pplg2_24/controllers/user_controller.dart';
import 'package:pas1_mobile_11pplg2_24/utils/snackbar.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/button_widget.dart';
import 'package:pas1_mobile_11pplg2_24/widgets/textfield_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final AuthController authController = Get.put(AuthController());
  final UserController userController = Get.put(UserController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome back!',
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            Text('Masukan username dan password.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
            const SizedBox(height: 60),
            Obx(() => TextFieldWidget('Username',
                controller: usernameController,
                disabled: authController.isLoading.value,
                prefixIcon: const Icon(Icons.person))),
            const SizedBox(height: 16),
            Obx(() => TextFieldWidget('Password',
                controller: passwordController,
                disabled: authController.isLoading.value,
                obscureText: authController.isObscure.value,
                prefixIcon: const Icon(Icons.key),
                suffixIcon: IconButton(
                    icon: Icon(authController.isObscure.value
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: !authController.isLoading.value
                        ? () => authController.toggleObscure()
                        : null))),
            const SizedBox(height: 40),
            Obx(() => ButtonWidget(
                  'Login',
                  variant: ButtonVariant.primary,
                  loading: authController.isLoading.value,
                  onPressed: !authController.isLoading.value
                      ? () async {
                          try {
                            String token = await authController.login(
                                usernameController.text,
                                passwordController.text);
                            await userController.fetchUser(token);
                            Snackbar.success(message: 'Login berhasil');
                            Get.offAllNamed('/dashboard');
                          } on ApiException catch (e) {
                            Snackbar.error(message: e.cause);
                          } on Exception catch (e) {
                            Snackbar.error(message: e.toString());
                          }
                        }
                      : null,
                ))
          ]),
    ));
  }
}
