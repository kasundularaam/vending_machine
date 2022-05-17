import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/shared/shared_services.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  Future activate({required int seconds}) async {
    final String userType = await SharedServices.getUserType();
    if (userType != "user") {
      emit(TimerActive());
      await Future.delayed(Duration(seconds: seconds));
      emit(TimerTimeout());
    }
  }
}
