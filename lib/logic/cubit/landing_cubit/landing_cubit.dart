import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vending_machine/data/http/user_services.dart';
import 'package:vending_machine/data/models/vm_user.dart';

import '../../../data/shared/shared_services.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future load() async {
    try {
      emit(LandingLoading());
      final bool isUserIn = await SharedServices.isUserIn();

      if (isUserIn) {
        final int uid = await SharedServices.getUid();
        final VMUser vmUser = await UserServices.getVMUser(uid: uid);
        emit(LandingToScanner(vmUser: vmUser));
      }
      if (!isUserIn) emit(LandingToAuth());
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
