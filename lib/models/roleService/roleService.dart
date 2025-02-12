import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../config/UrlConfig.dart';
import '../../utils/request/RoleRequest.dart';


class RoleService {
  final String token;

  RoleService(this.token);

  // Tạo vai trò mới
  Future<Map<String, dynamic>> createRole(RoleRequest roleRequest) async {
    try {
      final response = await http.post(
        Uri.parse(AppConfig.baseUrl + 'role/create'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: json.encode(roleRequest.toJson()),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);  // Trả về kết quả khi tạo thành công
      } else {
        throw Exception("Không thể tạo vai trò. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Xóa vai trò
  Future<Map<String, dynamic>> deleteRole(RoleRequest roleRequest) async {
    try {
      final response = await http.delete(
        Uri.parse(AppConfig.baseUrl + 'role/delete'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',  // Thêm Bearer token cho xác thực
        },
        body: json.encode(roleRequest.toJson()),  // Chuyển đối tượng thành JSON
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);  // Trả về kết quả khi xóa thành công
      } else {
        throw Exception("Không thể xóa vai trò. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }

  // Lấy tất cả các vai trò
  Future<List<Map<String, dynamic>>> getAllRoles() async {
    try {
      final response = await http.get(
        Uri.parse(AppConfig.baseUrl + 'role/all'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',  // Thêm Bearer token cho xác thực
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> result = json.decode(response.body);  // Chuyển đổi danh sách trả về từ JSON
        return result.map((e) => e as Map<String, dynamic>).toList();  // Chuyển đổi thành danh sách Map
      } else {
        throw Exception("Không thể lấy danh sách vai trò. Status: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
