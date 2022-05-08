import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'nickname')
  final String nickname;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'password')
  final String password;

  UserModel({
    required this.email,
    required this.nickname,
    required this.phone,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
