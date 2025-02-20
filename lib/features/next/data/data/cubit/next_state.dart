
abstract class NextState {}

final class NextInitial extends NextState {}

final class NextLaoding extends NextState {}

final class NextSuccess extends NextState {}

final class NextFaliures extends NextState {
  final String message;

  NextFaliures({required this.message});
}
