//TODO:CHange THis
// ignore_for_file: unused_field

enum ApplicationStatus{
  sumbitted,
  inReview,
  accepted,
  rejected,  
}
mixin ApplicationStatusMixin {
  static const Map<ApplicationStatus, String> _statusMap = {
    ApplicationStatus.sumbitted: 'Submitted',
    ApplicationStatus.inReview: 'In Review',
    ApplicationStatus.accepted: 'Accepted',
    ApplicationStatus.rejected: 'Rejected',
  };
  static const Map<String, ApplicationStatus> _statusMapReverse = {
    'Submitted': ApplicationStatus.sumbitted,
    'In Review': ApplicationStatus.inReview,
    'Accepted': ApplicationStatus.accepted,
    'Rejected': ApplicationStatus.rejected,
  };

}
