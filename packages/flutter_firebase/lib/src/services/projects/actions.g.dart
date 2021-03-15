// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SetProjectsAction _$SetProjectsActionFromJson(Map<String, dynamic> json) {
  return SetProjectsAction(
    (json['projects'] as List)
        ?.map((e) =>
            e == null ? null : Project.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SetProjectsActionToJson(SetProjectsAction instance) =>
    <String, dynamic>{
      'projects': instance.projects,
    };
