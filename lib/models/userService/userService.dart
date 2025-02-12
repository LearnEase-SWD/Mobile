import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/UrlConfig.dart';
import '../../utils/request/UserUpdateRequest.dart';
import '../../utils/request/userCreationRequest.dart';

class UserService {
  final String token;

  UserService(this.token);

  Future<List<dynamic>> getAllUsers() async {
    try {
      final response = await http.get(
        Uri.parse(AppConfig.baseUrl + "users"),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception("No users found.");
      } else {
        throw Exception("Failed to load users. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<Map<String, dynamic>> createUser(String userName, String email) async {
    UserCreationRequest request = UserCreationRequest(userName: userName, email: email);
    final response = await http.post(
      Uri.parse(AppConfig.baseUrl + "users/create"),
      headers: {
        "Content-Type": "application/json", // Đảm bảo gửi đúng header
      },
      body: json.encode(request.toJson()), // Sử dụng json.encode để gửi JSON
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 302) {
      // Xử lý nếu gặp redirect
      print('Redirected to: ${response.headers['location']}');
      throw Exception("Redirected to: ${response.headers['location']}");
    } else if (response.statusCode == 400) {
      var reponse = getUserByEmail(email);
      return reponse;
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> getUserByEmail(String email) async {
    try {
      final response = await http.get(
        Uri.parse(AppConfig.baseUrl + "users/getUserByEmail/$email"),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else if (response.statusCode == 404) {
        throw Exception("No users found.");
      } else {
        throw Exception("Failed to load users. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  Future<Map<String, dynamic>> updateUser(String id, String userName, String email) async {
    UserUpdateRequest request = UserUpdateRequest(userName: userName, email: email);
    final response = await http.put(
      Uri.parse(AppConfig.baseUrl + "users/update?id=$id"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(request.toJson()), // Sử dụng json.encode để gửi JSON
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> deleteUser(String id) async {
    final response = await http.delete(
      Uri.parse(AppConfig.baseUrl + "users/delete/$id"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return {"message": "User deleted successfully"};
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }

  Future<Map<String, dynamic>> getUserById(String id) async {
    final response = await http.get(
      Uri.parse(AppConfig.baseUrl + "users/$id"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Error: ${response.statusCode}");
    }
  }
}
