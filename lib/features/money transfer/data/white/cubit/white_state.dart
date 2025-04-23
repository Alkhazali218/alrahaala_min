part of 'white_cubit.dart';

@immutable
sealed class WhiteState {}

final class WhiteInitial extends WhiteState {}
final class WhiteLoading extends WhiteState {}
final class WhiteSuccess extends WhiteState {}
final class WhiteFaliures extends WhiteState {
  final String message;
  WhiteFaliures({required this.message});
}
