import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constant/api_contstant.dart';

import '../../../../core/helper/dio_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void Login( String email, String password,) async {
    emit(LoginLoading());
    final response = await DioHelper.postData(
      url: ApisClient.Api_Login,
      data: {
        'email': email,
        'password': password,
      },
    );
    if (response != null && response.statusCode == 200) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure("Registration Failed"));
    }
  }
}
