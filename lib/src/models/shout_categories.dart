import 'package:json_annotation/json_annotation.dart';
part 'shout_categories.g.dart';

@JsonSerializable()
class ShoutCategories {
  String? id;
  int? seqNo;
  String? categoryCode;
  String? categoryName;
  String? iconName;
  String? themeColor;
  int? totalSubcategoryCount;
  bool? enabled;
  bool? geographicallyRestricted;
  bool? onlyForAgency;
  String? categoryImage;

  ShoutCategories({
    this.id,
    this.seqNo,
    this.categoryCode,
    this.categoryName,
    this.iconName,
    this.themeColor,
    this.enabled,
    this.geographicallyRestricted,
    this.onlyForAgency,
    this.categoryImage,
  });

  factory ShoutCategories.fromJson(Map<String, dynamic> json) =>
      _$ShoutCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$ShoutCategoriesToJson(this);
}
