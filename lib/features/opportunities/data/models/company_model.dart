
import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_model.g.dart';
part 'company_model.freezed.dart';

@freezed
class CompanyModel with _$CompanyModel {
  const CompanyModel._();

  const factory CompanyModel({
    required String id,
    required String name,
    required String category,
    required String profilepic,
  }) = _CompanyModel;
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}
