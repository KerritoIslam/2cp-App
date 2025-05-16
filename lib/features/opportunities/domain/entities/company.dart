import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'opportunity_constants.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const Company._();

  const factory Company({
    required int id,
    required String name,
    @Default('')  String category,
    @Default('') String profilepic,
    String? date_joined,
    String? email,
    String? description,
    String? location,
    String? number,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  factory Company.fromModel(CompanyModel model) {
    return Company(
      id: model.id,
      name: model.name,
      category: CategoryMixin.choices[model.category] ?? 'None',
      profilepic: model.profilepic,
    );
  }

  CompanyModel toModel() {
    return CompanyModel(
      id: id,
      name: name,
      category: CategoryMixin.nameToCodeMap[category]!.name,
      profilepic: profilepic,
    );
  }
}
