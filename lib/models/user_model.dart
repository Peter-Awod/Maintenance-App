class UserModel {
  final String name;
  final String phone;
  final String email;
  final String userId;

  UserModel({
    required this.name,
    required this.phone,
    required this.email,
    required this.userId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'userId': userId,
    };
  }
}
