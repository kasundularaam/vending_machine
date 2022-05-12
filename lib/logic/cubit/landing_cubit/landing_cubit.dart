import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/shared/shared_services.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingInitial());

  Future load() async {
    try {
      emit(LandingLoading());
      final bool isUserIn = await SharedServices.isUserIn();
      if (isUserIn) emit(LandingToHome());
      if (!isUserIn) emit(LandingToAuth());
    } catch (e) {
      emit(LandingFailed(errorMsg: e.toString()));
    }
  }
}
