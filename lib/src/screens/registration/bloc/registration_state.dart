part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationLoaded extends RegistrationState {}

class RegistrationFailed extends RegistrationState {
  final String message;

  RegistrationFailed({
    required this.message,
  });
}
