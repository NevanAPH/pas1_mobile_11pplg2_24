class UserModel {
  final String username;
  final String? email;
  final String? fullName;
  
  final String? token;

  UserModel({
    required this.username,
    this.email,
    this.fullName,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'username': username,
      'email': email,
      'full_name': fullName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'],
      email: map['email'],
      fullName: map['full_name'],
      token: map['token'],
    );
  }
}