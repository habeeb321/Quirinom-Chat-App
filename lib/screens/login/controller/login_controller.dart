import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:qurinom_chat_app/screens/home/view/home_screen.dart';
import 'package:qurinom_chat_app/screens/login/model/login_model.dart';
import 'package:qurinom_chat_app/screens/login/service/login_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Rx<LoginModel?> loginModel = LoginModel().obs;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  var selectedUserType = 'vendor'.obs;
  var isPasswordVisible = false.obs;
  var loading = false.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> fetchLogin() async {
    loading.value = true;
    try {
      LoginModel? result = await LoginService.getLogin(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        role: selectedUserType.value,
      );

      if (result != null) {
        loginModel.value = result;
        storage.write(key: 'user_id', value: result.data?.user?.id);
        Get.offAll(() => const HomeScreen());
        Get.snackbar(
          'Success',
          'Login successful!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          'Failed',
          'Login Failed Please Try Again!',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      log("fetchLogin Error: $e");
    }
    loading.value = false;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void selectUserType(String type) {
    selectedUserType.value = type;
  }

  void handleLogin() async {
    if (formKey.currentState!.validate()) {
      fetchLogin();
    }
  }
}
