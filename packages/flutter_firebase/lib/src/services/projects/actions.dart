import 'package:flutter_firebase/src/services/projects/types.dart';
import 'package:json_annotation/json_annotation.dart';

part 'actions.g.dart';

@JsonSerializable()
class SetProjectsAction {
  final List<Project> projects;

  SetProjectsAction(this.projects);

  factory SetProjectsAction.fromJson(Map<String, dynamic> json) =>
      _$SetProjectsActionFromJson(json);

  Map<String, dynamic> toJson() => _$SetProjectsActionToJson(this);
}