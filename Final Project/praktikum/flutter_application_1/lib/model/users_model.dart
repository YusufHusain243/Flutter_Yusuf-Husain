class User {
  final int id;
  final String username;
  final String email;
  final String password;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
    );
  }

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'username': user.username,
        'email': user.email,
        'password': user.password,
      };
}