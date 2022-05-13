class DetailProject {
  final int id;
  final int projectId;
  final String name;
  bool status;

  DetailProject({
    required this.id,
    required this.projectId,
    required this.name,
    required this.status,
  });

  factory DetailProject.fromJson(Map<String, dynamic> json) {
    return DetailProject(
      id: json['id'],
      projectId: json['projectId'],
      name: json['name'],
      status: json['status'],
    );
  }

  static Map<String, dynamic> toJson(DetailProject itemProject) => {
        'id': itemProject.id,
        'projectId': itemProject.projectId,
        'name': itemProject.name,
        'status': itemProject.status,
      };
}
