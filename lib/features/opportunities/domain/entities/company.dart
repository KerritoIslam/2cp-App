import 'package:app/features/opportunities/data/models/opportunity_model.dart';
import 'package:app/features/opportunities/domain/entities/opportunity.dart';

class Company {
  final String id;
  final String name;
  final String category;
  final String imageUrl;
  Company( {required this.id, required this.name,required this.category,required this.imageUrl});
  toModel(){
    return CompanyModel(id: id, name: name, category:CategoryMixin.nameToCodeMap[category]??OpportunityCategory.None , imageUrl: imageUrl);
  }
}
