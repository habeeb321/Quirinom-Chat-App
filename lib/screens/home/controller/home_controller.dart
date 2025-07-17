import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:qurinom_chat_app/screens/home/model/chats_model.dart';
import 'package:qurinom_chat_app/screens/home/service/home_service.dart';
import 'package:qurinom_chat_app/screens/login/view/login_screen.dart';

class HomeController extends GetxController {
  RxList<ChatsModel> chatsList = <ChatsModel>[].obs;
  FlutterSecureStorage storage = const FlutterSecureStorage();

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLogin();
  }

  Future<void> fetchLogin() async {
    loading.value = true;
    String? userId = await storage.read(key: 'user_id');
    try {
      List<ChatsModel>? result = await HomeService.getChats(
        userId: userId ?? '',
      );

      if (result != null) {
        chatsList.value = result;
      } else {
        chatsList.clear();
      }
    } catch (e) {
      log("fetchLogin Error: $e");
      chatsList.clear();
    }
    loading.value = false;
  }

  void logout() async {
    await storage.deleteAll();
    Get.offAll(() => const LoginScreen());
  }
}
