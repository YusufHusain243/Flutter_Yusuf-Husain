class User {
  final int id;
  final String name;
  final String email;
  final String password;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }

  static Map<String, dynamic> toJson(User user) => {
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'password': user.password,
      };
}
