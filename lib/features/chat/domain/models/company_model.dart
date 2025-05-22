import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
class CompanyModel with _$CompanyModel {
  const factory CompanyModel({
    required int id,
    required String name,
    @Default("")  String category,
    @Default("")  String profilepic,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json){ 
    json['profilepic']='';
    
    return _$CompanyModelFromJson(json);}
}
