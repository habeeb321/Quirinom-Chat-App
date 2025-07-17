import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:qurinom_chat_app/screens/home/model/chats_model.dart';
import 'package:qurinom_chat_app/screens/home/model/send_message_model.dart';
import 'package:qurinom_chat_app/screens/home/model/specific_chat_model.dart';

class HomeService {
  static final Dio dio = Dio();

  static Future<List<ChatsModel>?> getChats({
    required String userId,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      Response response = await dio.get(
        'http://45.129.87.38:6065/chats/user-chats/$userId',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data != null) {
        log('Success: ${response.data}');

        List<dynamic> chatDataList;

        if (response.data is String) {
          chatDataList = jsonDecode(response.data);
        } else if (response.data is List) {
          chatDataList = response.data;
        } else {
          log('Unexpected response format: expected List but got ${response.data.runtimeType}');
          return null;
        }

        List<ChatsModel> chatsList = chatDataList.map((chatData) {
          if (chatData is Map<String, dynamic>) {
            return ChatsModel.fromJson(chatData);
          } else {
            throw Exception('Invalid chat data format');
          }
        }).toList();

        return chatsList;
      } else {
        log('HTTP Error: Status code ${response.statusCode}');
      }
    } catch (e) {
      log('getChats Error : $e');
    }
    return null;
  }

  static Future<List<SpecificChatModel>?> getSpecificChats({
    required String chatId,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    try {
      Response response = await dio.get(
        'http://45.129.87.38:6065/messages/get-messagesformobile/$chatId',
        options: Options(headers: headers),
      );

      if (response.statusCode == 200 && response.data != null) {
        log('Success: ${response.data}');

        List<dynamic> chatDataList;

        if (response.data is String) {
          chatDataList = jsonDecode(response.data);
        } else if (response.data is List) {
          chatDataList = response.data;
        } else {
          log('Unexpected response format: expected List but got ${response.data.runtimeType}');
          return null;
        }

        List<SpecificChatModel> chatsList = chatDataList.map((chatData) {
          if (chatData is Map<String, dynamic>) {
            return SpecificChatModel.fromJson(chatData);
          } else {
            throw Exception('Invalid chat data format');
          }
        }).toList();

        return chatsList;
      } else {
        log('HTTP Error: Status code ${response.statusCode}');
      }
    } catch (e) {
      log('getSpecificChats Error : $e');
    }
    return null;
  }

  static Future<SendMessageModel?> sendMessage({
    required String chatId,
    required String senderId,
    required String content,
  }) async {
    final headers = {
      'Content-Type': 'application/json',
    };

    final body = jsonEncode({
      "chatId": chatId,
      "senderId": senderId,
      "content": content,
      "messageType": "text",
      "fileUrl": ""
    });

    try {
      Response response = await dio.post(
        'http://45.129.87.38:6065/messages/sendMessage',
        options: Options(headers: headers),
        data: body,
      );

      if (response.statusCode == 200 && response.data != null) {
        log('Success: ${response.data}');
        if (response.data is String) {
          Map<String, dynamic> data = jsonDecode(response.data);
          return SendMessageModel.fromJson(data);
        } else if (response.data is Map) {
          Map<String, dynamic> data = response.data;
          return SendMessageModel.fromJson(data);
        } else {
          log('Unexpected response format');
          return null;
        }
      } else {
        log('HTTP Error: Status code ${response.statusCode}');
      }
    } catch (e) {
      log('sendMessage Error : $e');
    }
    return null;
  }
}
