part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {}

class TimerActive extends TimerState {}

class TimerTimeout extends TimerState {}
