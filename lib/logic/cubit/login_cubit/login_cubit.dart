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
          await SharedServices.addUser(uid: vmUser.id);
          emit(LoginUser(vmUser: vmUser));
        } else {
          final String deviceId = await SharedServices.getDeviceId();
          final VMUser vmUser =
              await UserServices.login(email: email, password: password);
          emit(LoginToMachine(vmUser: vmUser, deviceId: deviceId));
        }
      }
    } catch (e) {
      emit(LoginFailed(errorMsg: e.toString()));
    }
  }
}
