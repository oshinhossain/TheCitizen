
import 'package:json_annotation/json_annotation.dart';
part 'leave_balance_model.g.dart';

@JsonSerializable()
class LeaveBalanceModel {
  String? leaveCode;
  String? leaveType;
  int? totalBalane;
  double? leaveRequest;
  double? balanceAfterLeave;

  LeaveBalanceModel(
      {this.leaveCode,
      this.leaveType,
      this.totalBalane,
      this.leaveRequest,
      this.balanceAfterLeave});

       factory LeaveBalanceModel.fromJson(Map<String, dynamic> json) =>
      _$LeaveBalanceModelFromJson(json);
  Map<String, dynamic> toJson() => _$LeaveBalanceModelToJson(this);

}
