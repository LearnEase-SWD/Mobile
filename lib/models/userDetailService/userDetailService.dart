import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/UrlConfig.dart';
import '../../utils/request/UserDetailRequest.dart';


class UserDetailService {
  final String token;


  UserDetailService(this.token);

  // Tạo thông tin người dùng mới
  Future<Map<String, dynamic>> createUserDetail(UserDetailRequest userDetailRequest) async {
    try {
      final response = await http.post(
        Uri.parse(AppConfig.baseUrl + 'userDetails'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(userDetailRequest.toJson()),
      );

      if (response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw Exception("Không thể tạo thông tin người dùng. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }


  Future<Map<String, dynamic>> getUserDetailById(String id) async {
    try {
      final response = await http.get(
        Uri.parse(AppConfig.baseUrl + 'userDetails/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);  // Trả về thông tin người dùng nếu tìm thấy
      } else {
        throw Exception("Không tìm thấy thông tin người dùng. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Lấy thông tin người dùng theo UserId
  Future<Map<String, dynamic>> getUserDetailByUserId(String userId) async {
    try {
      final response = await http.get(
        Uri.parse(AppConfig.baseUrl + 'userDetails/user/$userId'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',  // Thêm Bearer token cho xác thực
        },
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);  // Trả về thông tin người dùng nếu tìm thấy
      } else {
        throw Exception("Không tìm thấy thông tin người dùng. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Cập nhật thông tin người dùng
  Future<Map<String, dynamic>> updateUserDetail(String id, UserDetailRequest userDetailRequest) async {
    try {
      final response = await http.put(
        Uri.parse(AppConfig.baseUrl + 'userDetails/$id'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',  // Thêm Bearer token cho xác thực
        },
        body: json.encode(userDetailRequest.toJson()),  // Chuyển đối tượng thành JSON
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);  // Trả về thông tin người dùng sau khi cập nhật
      } else {
        throw Exception("Không thể cập nhật thông tin người dùng. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
