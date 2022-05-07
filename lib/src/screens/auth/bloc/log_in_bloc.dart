import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../common/models/tokens/tokens_model.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial());

  final Dio dio = Dio();
  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<LogInState> mapEventToState(LogInEvent event) async* {
    yield LogInLoading();

    if (event is LogInPressed) {
      try {
        Response response = await dio.post(
          'http://api.codeunion.kz/api/v1/auth/login',
          data: {
            'email': event.email,
            'password': event.password,
          },
        );

        TokensModel tokensModel = TokensModel.fromJson(
          response.data['tokens'],
        );

        tokensBox.put('access', tokensModel.access);
        tokensBox.put('access', tokensModel.refresh);

        yield LogInLoaded();
      } on DioError catch (e) {
        yield LogInFailed(message: e.response!.data['message']);
        rethrow;
      } catch (e) {
        yield LogInFailed(message: 'Что-то пошло не так');
      }
    }
  }
}
