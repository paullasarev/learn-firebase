import 'package:json_annotation/json_annotation.dart';

part 'types.g.dart';

@JsonSerializable(createFactory: false)
class CountState {
  final int count;
  CountState(this.count);

  Map<String, dynamic> toJson() => _$CountStateToJson(this);
}
