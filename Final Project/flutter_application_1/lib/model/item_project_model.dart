class ItemProject {
  final int id;
  final int projectId;
  final String name;
  final bool status;

  ItemProject({
    required this.id,
    required this.projectId,
    required this.name,
    required this.status,
  });

  factory ItemProject.fromJson(Map<String, dynamic> json) {
    return ItemProject(
      id: json['id'],
      projectId: json['projectId'],
      name: json['name'],
      status: json['status'],
    );
  }

  static Map<String, dynamic> toJson(ItemProject itemProject) => {
        'id': itemProject.id,
        'projectId': itemProject.projectId,
        'name': itemProject.name,
        'status': itemProject.status,
      };
}
