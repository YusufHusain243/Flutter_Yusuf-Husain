class DetailProject {
  final int id;
  final int userId;
  final int projectId;

  DetailProject({
    required this.id,
    required this.userId,
    required this.projectId,
  });

  factory DetailProject.fromJson(Map<String, dynamic> json) {
    return DetailProject(
      id: json['id'],
      userId: json['userId'],
      projectId: json['projectId'],
    );
  }

  static Map<String, dynamic> toJson(DetailProject detailProject) => {
        'id': detailProject.id,
        'userId': detailProject.userId,
        'projectId': detailProject.projectId,
      };
}
