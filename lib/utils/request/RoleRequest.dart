class RoleRequest {
  final String name;

  RoleRequest({required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }

  factory RoleRequest.fromJson(Map<String, dynamic> json) {
    return RoleRequest(
      name: json['name'],
    );
  }
}
