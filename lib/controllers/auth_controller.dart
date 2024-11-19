import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_24/apis/services/login_service.dart';

class AuthController extends GetxController {

  Rx<bool> isLoading = false.obs;
  Rx<bool> isObscure = true.obs;

  Future<String> login(String username, String password) async {

    // Check if username and password is not empty
    if (username.isEmpty || password.isEmpty) {
      throw Exception('Username and password must not be empty.');
    }

    isLoading.value = true;
    try {
      String result = await LoginService.signIn(username, password);
      isLoading.value = false;
      return result;

    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  void setObscure(bool value) {
    isObscure.value = value;
  }
  void toggleObscure() {
    isObscure.value = !isObscure.value;
  }
}