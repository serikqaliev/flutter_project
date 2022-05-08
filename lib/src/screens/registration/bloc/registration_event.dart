part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class RegistrationPressed extends RegistrationEvent {
  final String? email;
  final String? nickname;
  final String? phone;
  final String? password;

  RegistrationPressed({
    required this.email,
    required this.nickname,
    required this.phone,
    required this.password,
  });
}
