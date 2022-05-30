part of 'purchase_cubit.dart';

@immutable
abstract class PurchaseState {}

class PurchaseInitial extends PurchaseState {}

class PurchaseLoading extends PurchaseState {}

class PurchaseUser extends PurchaseState {}

class PurchaseMachine extends PurchaseState {}

class PurchaseFailed extends PurchaseState {
  final String errorMsg;
  PurchaseFailed({
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PurchaseFailed && other.errorMsg == errorMsg;
  }

  @override
  int get hashCode => errorMsg.hashCode;

  @override
  String toString() => 'PurchaseFailed(errorMsg: $errorMsg)';
}
