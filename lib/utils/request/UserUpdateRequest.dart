class UserUpdateRequest {
  final String userName;
  final String email;

  UserUpdateRequest({required this.userName, required this.email});

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
    };
  }
}
