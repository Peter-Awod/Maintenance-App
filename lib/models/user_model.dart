class UserModel {
  final String name;
  final String email;
  final String phone;
  final String userId;
  final bool? isAdmin;
  final bool? isRequested;

  UserModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.userId,
    this.isAdmin,
    this.isRequested,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      userId: json['userId'],
      isAdmin: json['isAdmin'],
      isRequested: json['isRequested'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'userId': userId,
      'isAdmin': isAdmin,
      'isRequested': isRequested,
    };
  }
}
