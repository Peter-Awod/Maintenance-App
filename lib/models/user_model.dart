class UserModel {
  final String name;
  final String email;
  final String phone;
  final String userId;
  final bool? isAdmin;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.userId,
    this.isAdmin,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      userId: json['userId'],
      isAdmin: json['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'userId': userId,
      'isAdmin': isAdmin,
    };
  }
}
