import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  TimerCubit() : super(TimerInitial());

  Future activate({required int seconds}) async {
    emit(TimerActive());
    await Future.delayed(Duration(seconds: seconds));
    emit(TimerTimeout());
  }
}
