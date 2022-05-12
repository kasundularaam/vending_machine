import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/http/user_services.dart';
import '../../../data/models/new_vm_user.dart';
import '../../../data/models/vm_user.dart';
import '../../../data/shared/shared_services.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future register({required NewVMUser newVMUser}) async {
    try {
      emit(RegisterLoading());

      final String userType = await SharedServices.getUserType();
      if (userType == "user") {
        final VMUser vmUser =
            await UserServices.addVMUser(newVMUser: newVMUser);
        await SharedServices.loginAsUser(uid: vmUser.id);
        emit(RegisterSucceed(vmUser: vmUser));
      } else {
        final VMUser vmUser =
            await UserServices.addVMUser(newVMUser: newVMUser);
        emit(RegisterSucceed(vmUser: vmUser));
      }
    } catch (e) {
      emit(RegisterFailed(errorMsg: e.toString()));
    }
  }
}
