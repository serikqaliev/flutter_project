// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      login: json['login'] as String,
      phoneNumber: json['phoneNumber'] as String,
      mail: json['mail'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'login': instance.login,
      'phoneNumber': instance.phoneNumber,
      'mail': instance.mail,
      'password': instance.password,
    };
