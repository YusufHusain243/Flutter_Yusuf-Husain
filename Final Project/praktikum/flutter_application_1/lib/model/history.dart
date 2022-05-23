class History {
  final int id;
  final int projectId;
  final String name;
  bool status;
  final String createdAt;

  History({
    required this.id,
    required this.projectId,
    required this.name,
    required this.status,
    required this.createdAt,
  });

  factory History.fromJson(Map<String, dynamic> json) {
    return History(
      id: json['id'],
      projectId: json['project_id'],
      name: json['name'],
      status: json['status'],
      createdAt: json['created_at'],
    );
  }

  static Map<String, dynamic> toJson(History history) => {
        'id': history.id,
        'projectId': history.projectId,
        'name': history.name,
        'status': history.status,
        'created_at': history.createdAt,
      };
}
