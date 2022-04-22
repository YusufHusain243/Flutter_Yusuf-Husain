class Food {
  final int id;
  final String name;

  Food({required this.id, required this.name});

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'],
      name: json['name'],
    );
  }

  static Map<String, dynamic> toJson(Food food) => {
        'id': food.id,
        'name': food.name,
      };
}
