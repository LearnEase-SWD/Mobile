class CacheRequest {
  final String key;
  final String value;
  final int time;

  CacheRequest({
    required this.key,
    required this.value,
    required this.time,
  });

  // Hàm chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'value': value,
      'time': time,
    };
  }

  // Hàm khởi tạo đối tượng từ JSON
  factory CacheRequest.fromJson(Map<String, dynamic> json) {
    return CacheRequest(
      key: json['key'],
      value: json['value'],
      time: json['time'],
    );
  }
}
