import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/user_services.dart';
import '../../../data/models/vm_user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login({required String email, required String password}) async {
    try {
      emit(LoginLoading());
      final VMUser vmUser =
          await UserServices.login(email: email, password: password);
      emit(LoginSucceed(vmUser: vmUser));
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
