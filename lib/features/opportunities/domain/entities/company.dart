import 'package:app/features/opportunities/data/models/company_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'opportunity_constants.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
class Company with _$Company {
  const Company._();

  const factory Company({
    required String id,
    required String name,
    required String category,
    required String imageUrl,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  factory Company.fromModel(CompanyModel model) {
    return Company(
      id: model.id,
      name: model.name,
      category: CategoryMixin.choices[model.category] ?? 'None',
      imageUrl: model.imageUrl,
    );
  }

  CompanyModel toModel() {
    return CompanyModel(
      id: id,
      name: name,
      category: CategoryMixin.nameToCodeMap[category]!.name,
      imageUrl: imageUrl,
    );
  }
}
