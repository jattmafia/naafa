import 'package:freezed_annotation/freezed_annotation.dart';
part 'auth_model.freezed.dart';

part 'auth_model.g.dart';
@freezed
class AuthModel with _$AuthModel {

  factory AuthModel({
    required String email,
    required String password,
    required String username,
    required String phone,
    required String address,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => super.toJson();
}