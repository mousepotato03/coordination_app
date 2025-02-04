import 'package:json_annotation/json_annotation.dart';

part 'main_color.dto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class MainColor {
  @JsonKey(name: 'main_color')
  final String mainColor;

  MainColor(this.mainColor);

  factory MainColor.fromJson(Map<String, dynamic> json) {
    return _$MainColorFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MainColorToJson(this);
}
