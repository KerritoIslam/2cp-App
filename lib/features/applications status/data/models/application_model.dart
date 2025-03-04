import 'package:app/features/applications%20status/constants/status.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:app/features/opportunities/data/models/company_model.dart';
part 'application_model.freezed.dart';
part 'application_model.g.dart';
@Freezed(fromJson: true,toJson: true)

class ApplicationModel with _$ApplicationModel{
  const ApplicationModel._();
  factory ApplicationModel({
    required String id,
    required String proposal,
    required OpportunityModel post,
    required DateTime sumbittedAt,
    required String type,
   @Default(ApplicationStatus.sumbitted) ApplicationStatus status,
  }) = _ApplicationModel;
  factory ApplicationModel.fromJson(Map<String, dynamic> json) =>
      _$ApplicationModelFromJson(json);
  Map<String,dynamic> toCustomJson() {
    final json=toJson();
    json['post']=post.toJson();
    return json;
  }  
}

