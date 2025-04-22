import 'package:freezed_annotation/freezed_annotation.dart';

part 'attachementModel.freezed.dart';
part 'attachementModel.g.dart';
@freezed
class Attachementmodel with _$Attachementmodel {

  const Attachementmodel._();
  factory Attachementmodel({
    required int id,
    required String fileName,
    required String fileType,
    required String fileUrl,
    required String fileSize,
    required DateTime createdAt,
    required DateTime updatedAt,
    
  })
  = _Attachementmodel;    
  factory Attachementmodel.fromJson(Map<String, dynamic> json) =>
      _$AttachementmodelFromJson(json); 
}
