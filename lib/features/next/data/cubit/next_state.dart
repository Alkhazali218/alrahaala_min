part of 'next_cubit.dart';

@immutable
sealed class NextState {}

final class NextInitial extends NextState {}

final class NextLoading extends NextState {}

class NextSuccess extends NextState {
  final List<String> cityNames;

  NextSuccess({required this.cityNames});
}

final class NextFaliures extends NextState {
  final String message;

  NextFaliures({required this.message});
}
