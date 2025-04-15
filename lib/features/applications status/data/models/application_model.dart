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
    try {
     json['sumbittedAt']=DateTime.now().toIso8601String();
    json['type']=json['Type']?? 'application';
     return  _$ApplicationModelFromJson(json);

        } catch (e) {
        print(e);
       throw Exception('Failed to parse ApplicationModel: $e');
      
        }
      }
  Map<String,dynamic> toCustomJson() {
    final json=toJson();
    json['post']=post.toJson();
    //FallBack to current time if sumbittedAt is null
    json['sumbittedAt']=DateTime.now().toIso8601String();
    json['type']=json['Type']?? 'application';
    return json;
  }  
}

