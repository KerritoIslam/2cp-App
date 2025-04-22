import 'package:app/features/applications%20status/constants/status.dart';
import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'application_model.freezed.dart';
part 'application_model.g.dart';
@Freezed(fromJson: true,toJson: true)

class ApplicationModel with _$ApplicationModel{
  const ApplicationModel._();
  factory ApplicationModel({
    required int id,
    required String proposal,
    required OpportunityModel post,
    required DateTime sumbittedAt,
    required String type,
   @Default(ApplicationStatus.submitted) ApplicationStatus status,
  }) = _ApplicationModel;
  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    print(json);
  return ApplicationModel(
    
    id: json['id'] as int,
    proposal: json['proposal'] as String,
    post: OpportunityModel.fromJson(json['post'] as Map<String, dynamic>),
    sumbittedAt: json['sumbittedAt'] != null
        ? DateTime.parse(json['sumbittedAt'])
        : DateTime.now(), // Dummy value
    type: json['type'] ?? 'default_type', // Dummy string value
    status: $enumDecodeNullable(_$ApplicationStatusEnumMap, json['status']) ??
        ApplicationStatus.submitted,
  );
}  Map<String,dynamic> toCustomJson() {
    final json=toJson();
    json['sumbittedAt']=sumbittedAt.toIso8601String();
    json['post']=post.toJson();
    return json;
  }  
}

