import 'dart:convert';

import 'package:instagram/data/models/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/data/models/user_model.dart';

class ApiInstagramService {
  // baseUrl: URL
  // http://192.168.1.100:3434/v1/api //baseUrl when using hp
  String baseUrl = 'http://10.0.2.2:3434/v1/api'; //baseurl when using emulator

  Future<UserModel> login(String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      
      return UserModel.fromJson(jsonResponse);
    }else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<CommentModel> addcomment(String postId, String username,String commentText) async {
    final response = await http.post(
      Uri.parse('$baseUrl/comment'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        'postId': postId,
        'username': username,
        'commentText': commentText
      }),
    );
       print('response  add comment 1 : ${response}');

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print('response add post comment : ${jsonResponse}');
      return CommentModel.fromJson(jsonResponse);
    } else {
      throw Exception('Failed to login: ${response.body}');
    }
  }

  Future<List<CommentModel>> getComments() async {
    final response = await http.get(Uri.parse('$baseUrl/comments'),
        headers: {"Content-Type": "application/json"});
     print(' get post comment : ${response}');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
     if (jsonResponse.containsKey('data')) {
        List<dynamic> commentsList = jsonResponse['data'];
        print('comments list: $commentsList');

        return commentsList
            .map((comment) => CommentModel.fromJson(comment))
            .toList();
      } else {
        throw Exception('No comments data found');
      }
    } else {
      throw Exception('Failed to load comment');
    }
  }
}
