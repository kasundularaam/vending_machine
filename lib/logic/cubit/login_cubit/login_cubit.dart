import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vending_machine/data/shared/shared_services.dart';

import '../../../core/constants/strings.dart';
import '../../../data/http/user_services.dart';
import '../../../data/models/vm_user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future login({required String email, required String password}) async {
    try {
      emit(LoginLoading());

      if (email == Strings.adminEmail && password == Strings.password) {
        emit(LoginAdmin());
      } else {
        final String userType = await SharedServices.getUserType();
        if (userType == "user") {
          final VMUser vmUser =
              await UserServices.login(email: email, password: password);
          await SharedServices.loginAsUser(uid: vmUser.id);
          emit(LoginUser(vmUser: vmUser));
        } else {
          final VMUser vmUser =
              await UserServices.login(email: email, password: password);
          emit(LoginUser(vmUser: vmUser));
        }
      }
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
