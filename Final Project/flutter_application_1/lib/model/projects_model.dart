class Project {
  final int id;
  final int userId;
  final String nameProject;
  final String codeProject;

  Project({
    required this.id,
    required this.userId,
    required this.nameProject,
    required this.codeProject,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'],
      userId: json['userId'],
      nameProject: json['nameProject'],
      codeProject: json['codeProject'],
    );
  }

  static Map<String, dynamic> toJson(Project project) => {
        'id': project.id,
        'userId': project.userId,
        'nameProject': project.nameProject,
        'codeProject': project.codeProject,
      };
}
