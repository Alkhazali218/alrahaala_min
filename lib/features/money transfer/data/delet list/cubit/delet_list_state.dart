part of 'delet_list_cubit.dart';

@immutable
sealed class DeletListState {}

final class DeletListInitial extends DeletListState {}
final class DeletListLoading extends DeletListState {}
final class DeletListSuccess extends DeletListState {}
final class DeletListFaliures extends DeletListState {
  final String message;
  DeletListFaliures({required this.message});
}
