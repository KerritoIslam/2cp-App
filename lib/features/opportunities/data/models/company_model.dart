import 'package:app/features/opportunities/domain/entities/company.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'company_model.g.dart';
part 'company_model.freezed.dart';

@Freezed(toJson: true, fromJson: true)
class CompanyModel with _$CompanyModel {
  const CompanyModel._();
  const factory CompanyModel({
    required int id,
    required String name,
    @Default('None') String category,
    @Default('') String profilepic,
  }) = _CompanyModel;
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    json['profilepic'] = json['profilepic']['link'] ?? "";
    return _$CompanyModelFromJson(json);
  }

  Company toEntity() {
    return Company(
      id: id,
      name: name,
      category: category,
      profilepic: profilepic,
    );
  }
}
