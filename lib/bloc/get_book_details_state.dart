part of 'get_book_details_bloc.dart';

@immutable
abstract class GetBookDetailsState {}

class GetBookDetailsInitial extends GetBookDetailsState {}

class GetBookDetailsLoading extends GetBookDetailsState {}

class GetBookDetailsSuccess extends GetBookDetailsState {}

class GetBookDetailsError extends GetBookDetailsState {
  final String error;

  GetBookDetailsError(this.error);

}
