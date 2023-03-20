import 'package:json_annotation/json_annotation.dart';
part 'req_shout_category_subcategory.g.dart';

@JsonSerializable()
class RequesShoutCategorySubCategory {
  String? id;
  String? shoutCategoryId;
  String? shoutCategoryCode;
  String? shoutCategoryName;
  String? shoutCategorySeqNo;
  String? shoutTypeName;
  String? description;
  String? status;
  String? createdById;
  String? createdAt;
  String? masterViewModel;

  RequesShoutCategorySubCategory(
      {this.id,
      this.shoutCategoryId,
      this.shoutCategoryCode,
      this.shoutCategoryName,
      this.shoutCategorySeqNo,
      this.shoutTypeName,
      this.description,
      this.status,
      this.createdById,
      this.createdAt,
      this.masterViewModel});

  factory RequesShoutCategorySubCategory.fromJson(Map<String, dynamic> json) => _$RequesShoutCategorySubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$RequesShoutCategorySubCategoryToJson(this);
}
