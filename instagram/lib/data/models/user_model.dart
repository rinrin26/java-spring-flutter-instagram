class UserModel {
  final String username;
  final String password;
  final String? name;
  String? token;
  int? expiredAt;

  UserModel(
      {required this.username,
      required this.password,
      this.token,
      this.expiredAt,
      this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        username: '',
        password: '',
        token: json['token'],
        expiredAt: json['expiredAt'],
        name: '');
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
