import 'dart:developer';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:qurinom_chat_app/screens/home/model/chats_model.dart';
import 'package:qurinom_chat_app/screens/home/model/send_message_model.dart';
import 'package:qurinom_chat_app/screens/home/model/specific_chat_model.dart'
    as SpecificModel;
import 'package:qurinom_chat_app/screens/home/service/home_service.dart';
import 'package:qurinom_chat_app/screens/login/view/login_screen.dart';

class HomeController extends GetxController {
  RxList<ChatsModel> chatsList = <ChatsModel>[].obs;
  RxList<SpecificModel.SpecificChatModel> specificChatsList =
      <SpecificModel.SpecificChatModel>[].obs;
  Rx<SendMessageModel?> sendMessageModel = SendMessageModel().obs;

  FlutterSecureStorage storage = const FlutterSecureStorage();

  var loading = false.obs;
  var currentUserId = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLogin();
    getCurrentUserId();
  }

  Future<void> getCurrentUserId() async {
    String? userId = await storage.read(key: 'user_id');
    if (userId != null) {
      currentUserId.value = userId;
    }
  }

  bool isCurrentUser(String senderId) {
    return currentUserId.value == senderId;
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

  Future<void> fetchSpecificChats(String chatId) async {
    loading.value = true;
    try {
      List<SpecificModel.SpecificChatModel>? result =
          await HomeService.getSpecificChats(
        chatId: chatId,
      );

      if (result != null) {
        result.sort((a, b) {
          if (a.createdAt == null || b.createdAt == null) return 0;
          return a.createdAt!.compareTo(b.createdAt!);
        });
        specificChatsList.value = result;
      } else {
        specificChatsList.clear();
      }
    } catch (e) {
      log("fetchSpecificChats Error: $e");
      specificChatsList.clear();
    }
    loading.value = false;
  }

  Future<void> fetchSendMessage(
    String chatId,
    String senderId,
    String content,
  ) async {
    loading.value = true;
    try {
      SendMessageModel? result = await HomeService.sendMessage(
        chatId: chatId,
        senderId: senderId,
        content: content,
      );

      if (result != null) {
        sendMessageModel.value = result;
      }
    } catch (e) {
      log("fetchSendMessage Error: $e");
    }
    loading.value = false;
  }

  Future<void> markAsRead(String chatId) async {
    try {
      await fetchSpecificChats(chatId);
    } catch (e) {
      log("markAsRead Error: $e");
    }
  }

  void logout() async {
    await storage.deleteAll();
    currentUserId.value = '';
    Get.offAll(() => const LoginScreen());
  }
}
