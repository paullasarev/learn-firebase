import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

@JsonSerializable()
class Project {
  String name;
  String description;
  Project(this.name, this.description);

  factory Project.fromJson(Map<String, dynamic> json) => _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable()
class ProjectState {
  List<Project> projects;

  ProjectState(this.projects);

  factory ProjectState.fromJson(Map<String, dynamic> json) => _$ProjectStateFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectStateToJson(this);
}
