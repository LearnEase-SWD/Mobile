import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_ease_mobile/utils/request/CacheRequest.dart';
import '../../config/UrlConfig.dart';

class RedisService {
  final String token;

  RedisService(this.token);

  Future<String> getCache(String key) async {
    final response = await http.get(
      Uri.parse(AppConfig.baseUrl + "redis/$key"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      return response.body; // Trả về giá trị cache
    } else if (response.statusCode == 404) {
      throw Exception("Key không tồn tại trong cache.");
    } else {
      throw Exception("Lỗi khi lấy giá trị từ cache. Status: ${response.statusCode}");
    }
  }


  Future<void> setCache(String key, String value, int time) async {
    CacheRequest cacheRequest = CacheRequest(key: key, value: value, time: time);
    final response = await http.post(
      Uri.parse(AppConfig.baseUrl + "redis"),
      headers: {
        "Content-Type": "application/json",
      },
      body: json.encode(cacheRequest.toJson()),
    );
    print(response.toString());
    if (response.statusCode == 200) {
      print("Đã lưu vào cache");
    } else {
      throw Exception("Lỗi khi lưu vào cache. Status: ${response.statusCode}");
    }
  }

  // Xóa giá trị khỏi cache
  Future<void> removeCache(String key) async {
    final response = await http.delete(
      Uri.parse(AppConfig.baseUrl + "redis/$key"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      print("Đã xóa cache");
    } else {
      throw Exception("Lỗi khi xóa cache. Status: ${response.statusCode}");
    }
  }
}
