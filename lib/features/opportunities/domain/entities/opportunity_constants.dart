enum OpportunityStatus { open,close,pending }
enum OpportunityType { internship, Problem }
enum OpportunityCategory { EC, CS, EG, AH, HL, BM, LW, ED, None }

class CategoryMixin {
  static const Map<String, String> choices = {
    'EC': 'Economics',
    'CS': 'Computer Science & IT',
    'EG': 'Engineering',
    'AH': 'Arts & Humanities',
    'HL': 'Healthcare',
    'BM': 'Business & Management',
    'LW': 'Law',
    'ED': 'Education',
    'None': 'None',
  };

  static const Map<String, OpportunityCategory> nameToCodeMap = {
    'Economics': OpportunityCategory.EC,
    'Computer Science & IT': OpportunityCategory.CS,
    'Engineering': OpportunityCategory.EG,
    'Arts & Humanities': OpportunityCategory.AH,
    'Healthcare': OpportunityCategory.HL,
    'Business & Management': OpportunityCategory.BM,
    'Law': OpportunityCategory.LW,
    'Education': OpportunityCategory.ED,
    'None': OpportunityCategory.None,
  };
}
