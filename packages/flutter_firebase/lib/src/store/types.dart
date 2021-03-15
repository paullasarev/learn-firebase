import 'package:json_annotation/json_annotation.dart' show JsonSerializable;

import 'package:flutter_firebase/src/services/projects/types.dart';
import 'package:flutter_firebase/src/services/count/types.dart';

part 'types.g.dart';

@JsonSerializable(createFactory: false)
class StoreState {
  ProjectState projects;
  CountState count;

  StoreState({
    this.projects,
    this.count,
  });

  Map<String, dynamic> toJson() => _$StoreStateToJson(this);
}