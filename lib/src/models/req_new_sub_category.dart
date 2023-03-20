import 'package:json_annotation/json_annotation.dart';
part 'req_new_sub_category.g.dart';

@JsonSerializable()
class ReqNewSubCategory {
  String? id;
  String? categoryId;
  int? categorySeqNo;
  String? categoryCode;
  String? categoryName;
  String? subcategoryName;
  String? subcategoryDescription;
  String? requestDate;
  String? requesterFullname;
  String? requesterUsername;
  String? requesterEmail;
  String? requesterMobile;
  String? statusCode;
  String? status;
  String? masterViewModel;
  ReqNewSubCategory(
      {this.id,
      this.categoryId,
      this.categorySeqNo,
      this.categoryCode,
      this.categoryName,
      this.subcategoryName,
      this.subcategoryDescription,
      this.requestDate,
      this.requesterFullname,
      this.requesterUsername,
      this.requesterEmail,
      this.requesterMobile,
      this.statusCode,
      this.status,
      this.masterViewModel});

  factory ReqNewSubCategory.fromJson(Map<String, dynamic> json) => _$ReqNewSubCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$ReqNewSubCategoryToJson(this);
}
