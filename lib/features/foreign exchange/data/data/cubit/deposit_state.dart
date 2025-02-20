
import 'package:alrahaala/features/foreign%20exchange/data/data/model/deposit_model.dart';

sealed class DepositState {}

final class DepositInitial extends DepositState {}

final class DepositLoading extends DepositState {}

final class DepositSuccess extends DepositState {
   List<DataDepositModel> deposit = [];
  DepositSuccess(this.deposit);
}

final class DepositFaliures extends DepositState {
  final String message;

  DepositFaliures({required this.message});
}
