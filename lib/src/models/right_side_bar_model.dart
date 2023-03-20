import 'package:json_annotation/json_annotation.dart';
part 'right_side_bar_model.g.dart';

@JsonSerializable()
class RightSidebar {
  String? title;
  String? iconPath;
  List<RightSidebarChildren>? children;

  RightSidebar({this.title, this.iconPath, this.children});

  factory RightSidebar.fromJson(Map<String, dynamic> json) =>
      _$RightSidebarFromJson(json);
  Map<String, dynamic> toJson() => _$RightSidebarToJson(this);
}

@JsonSerializable()
class RightSidebarChildren {
  String? title;

  RightSidebarChildren({
    this.title,
  });

  factory RightSidebarChildren.fromJson(Map<String, dynamic> json) =>
      _$RightSidebarChildrenFromJson(json);
  Map<String, dynamic> toJson() => _$RightSidebarChildrenToJson(this);
}
