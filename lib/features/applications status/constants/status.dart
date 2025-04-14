//TODO:CHange THis
// ignore_for_file: unused_field

enum ApplicationStatus {
  submitted,
  under_review,
  accepted,
  rejected,
}

mixin ApplicationStatusMixin {
  static const Map<ApplicationStatus, String> statusMap = {
    ApplicationStatus.submitted: 'Submitted',
    ApplicationStatus.under_review: 'In Review',
    ApplicationStatus.accepted: 'Accepted',
    ApplicationStatus.rejected: 'Rejected',
  };
  static const Map<String, ApplicationStatus> statusMapReverse = {
    'Submitted': ApplicationStatus.submitted,
    'In Review': ApplicationStatus.under_review,
    'Accepted': ApplicationStatus.accepted,
    'Rejected': ApplicationStatus.rejected,
  };
}
