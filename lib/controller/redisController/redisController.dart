import 'dart:convert';
import 'package:learn_ease_mobile/utils/request/CacheRequest.dart';
import '../../config/UrlConfig.dart';
import '../../models/redisService/redisService.dart';


class RedisController {
  final RedisService redisService;

  RedisController({required this.redisService});

  Future<String> getDataFromCacheOrService(String key, Function fetchDataFromService) async {
    try {
      String cacheData = await redisService.getCache(key);
      print("Dữ liệu lấy từ cache: $cacheData");
      return cacheData;
    } catch (e) {
      print("Không tìm thấy dữ liệu trong cache. Lỗi: $e");

      var data = await fetchDataFromService();
      await redisService.setCache(key, json.encode(data), 3600);
      print("Dữ liệu lấy từ dịch vụ và đã lưu vào cache: $data");

      return json.encode(data);
    }
  }

  Future<void> setCache(String key, String value, int time) async {
    try {
      await redisService.setCache(key, value, time);
      print("Dữ liệu đã được lưu vào cache.");
    } catch (e) {
      print("Lỗi khi lưu dữ liệu vào cache: $e");
    }
  }

  Future<void> removeCache(String key) async {
    try {
      await redisService.removeCache(key);
      print("Dữ liệu đã bị xóa khỏi cache.");
    } catch (e) {
      print("Lỗi khi xóa dữ liệu khỏi cache: $e");
    }
  }
}

