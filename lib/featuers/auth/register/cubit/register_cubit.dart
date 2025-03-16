import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/constant/api_contstant.dart';
import 'package:marketi/featuers/auth/register/cubit/register_state.dart';

import '../../../../core/helper/dio_helper.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  void register(String name, String email, String password, String password_confirm, String phone) async {
    emit(RegisterLoading());
    final response = await DioHelper.postData(
      url: ApisClient.Api_Register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'confirmPassword': password_confirm,
        'phone': phone,
      },
    );
    if (response != null && response.statusCode == 200) {
      emit(RegisterSuccess());
    } else {
      emit(RegisterFailure("Registration Failed"));
    }
  }
}
