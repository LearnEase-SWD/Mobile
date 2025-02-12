class UserCreationRequest {
  final String userName;
  final String email;

  // Constructor
  UserCreationRequest({required this.userName, required this.email});

  // Tạo phương thức để chuyển đổi từ Map (JSON) thành đối tượng UserCreationRequest
  factory UserCreationRequest.fromJson(Map<String, dynamic> json) {
    return UserCreationRequest(
      userName: json['userName'],
      email: json['email'],
    );
  }

  // Phương thức để chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
    };
  }
}
