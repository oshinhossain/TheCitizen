import 'package:json_annotation/json_annotation.dart';
part 'request_new_shout_category.g.dart';

@JsonSerializable()
class RequestNewShoutCategory {
  String? id;
  String? categoryName;
  String? categoriesDescription;
  String? requestDate;
  String? requesterFullname;
  String? requesterUsername;
  String? requesterEmail;
  String? requesterMobile;
  String? statusCode;
  String? status;
  String? masterViewModel;

  RequestNewShoutCategory(
      {this.id,
      this.categoryName,
      this.categoriesDescription,
      this.requestDate,
      this.requesterFullname,
      this.requesterUsername,
      this.requesterEmail,
      this.requesterMobile,
      this.statusCode,
      this.status,
      this.masterViewModel});

  factory RequestNewShoutCategory.fromJson(Map<String, dynamic> json) => _$RequestNewShoutCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$RequestNewShoutCategoryToJson(this);
}
