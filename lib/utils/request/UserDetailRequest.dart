class UserDetailRequest {
  final String userId;
  final String fullName;
  final String address;

  UserDetailRequest({required this.userId, required this.fullName, required this.address});

  // Phương thức chuyển đối tượng thành JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'fullName': fullName,
      'address': address,
    };
  }
}
