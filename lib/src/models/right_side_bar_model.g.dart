// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'right_side_bar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RightSidebar _$RightSidebarFromJson(Map<String, dynamic> json) => RightSidebar(
      title: json['title'] as String?,
      iconPath: json['iconPath'] as String?,
      children: (json['children'] as List<dynamic>?)
          ?.map((e) => RightSidebarChildren.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RightSidebarToJson(RightSidebar instance) =>
    <String, dynamic>{
      'title': instance.title,
      'iconPath': instance.iconPath,
      'children': instance.children,
    };

RightSidebarChildren _$RightSidebarChildrenFromJson(
        Map<String, dynamic> json) =>
    RightSidebarChildren(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$RightSidebarChildrenToJson(
        RightSidebarChildren instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
