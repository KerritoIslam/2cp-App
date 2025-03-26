//TODO:CHange THis
// ignore_for_file: unused_field

enum ApplicationStatus {
  submitted,
  inReview,
  accepted,
  rejected,
}

mixin ApplicationStatusMixin {
  static const Map<ApplicationStatus, String> statusMap = {
    ApplicationStatus.submitted: 'Submitted',
    ApplicationStatus.inReview: 'In Review',
    ApplicationStatus.accepted: 'Accepted',
    ApplicationStatus.rejected: 'Rejected',
  };
  static const Map<String, ApplicationStatus> statusMapReverse = {
    'Submitted': ApplicationStatus.submitted,
    'In Review': ApplicationStatus.inReview,
    'Accepted': ApplicationStatus.accepted,
    'Rejected': ApplicationStatus.rejected,
  };
}
