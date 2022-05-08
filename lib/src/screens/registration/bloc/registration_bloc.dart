import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../../common/models/tokens/tokens_model.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationInitial());

  final Dio dio = Dio();
  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegistrationPressed) {
      yield RegistrationLoading();
      try {
        Response response = await dio.post(
          'http://api.codeunion.kz/api/v1/auth/registration/customer/new',
          data: {
            'email': event.email,
            'nickname': event.nickname,
            'phone': event.phone,
            'password': event.password,
          },
        );

        TokensModel tokensModel = TokensModel.fromJson(
          response.data!['tokens'],
        );
        tokensBox.put('access', tokensModel.access);
        tokensBox.put('refresh', tokensModel.refresh);
        yield RegistrationLoaded();
      } on DioError catch (e) {
        final int? statusCode = e.response!.statusCode;

        if (statusCode == 202) {
          yield RegistrationFailed(
            message: "Такой пользователь уже существует",
          );
        }

        yield RegistrationFailed(
          message: "Некорректные данные, попробуйте снова",
        );
        rethrow;
      } catch (e) {
        yield RegistrationFailed(
          message: "Произошла ошибка",
        );
        rethrow;
      }
    }
  }
}
