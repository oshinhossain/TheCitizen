import 'package:json_annotation/json_annotation.dart';
part 'shout_sub_categories.g.dart';

@JsonSerializable()
class ShoutSubCategories {
  String? id;
  String? categoryId;
  int? icategorySeqNod;
  String? categoryCode;
  String? categoryName;
  int? seqNo;
  String? subcategoryCode;
  String? subcategoryName;
  bool? needsClosureByShouter;
  String? attentionSelectorType;
  bool? canBeAnonymous;
  String? defaultUrgency;
  int? agenciesAssignedNo;
  String? geoRestrictionType;
  int? geoRestrictionLevel;
  int? geoRoutingLevel;
  String? sucThemeColor;
  String? subcategoryImage;

  ShoutSubCategories({
    this.id,
    this.categoryId,
    this.icategorySeqNod,
    this.categoryCode,
    this.categoryName,
    this.seqNo,
    this.subcategoryCode,
    this.subcategoryName,
    this.needsClosureByShouter,
    this.attentionSelectorType,
    this.canBeAnonymous,
    this.defaultUrgency,
    this.agenciesAssignedNo,
    this.geoRestrictionType,
    this.geoRestrictionLevel,
    this.geoRoutingLevel,
    this.sucThemeColor,
    this.subcategoryImage,
  });

  factory ShoutSubCategories.fromJson(Map<String, dynamic> json) =>
      _$ShoutSubCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$ShoutSubCategoriesToJson(this);
}
