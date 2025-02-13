part of 'forgien_cubit.dart';

@immutable
sealed class ForgienState {}

final class ForgienInitial extends ForgienState {}

final class ForgienLoading extends ForgienState {}

final class ForgienSuccess extends ForgienState {
  final List<DataForgienModel> forgien;

  ForgienSuccess({required this.forgien});
}


final class ForgienFaliures extends ForgienState {
  final String message;

  ForgienFaliures({required this.message});
}
