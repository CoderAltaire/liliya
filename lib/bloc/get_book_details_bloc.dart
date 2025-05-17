import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com.example.liliya/hive_helper/hive_names.dart';
import 'package:com.example.liliya/models/book_details.dart';

import 'package:meta/meta.dart';

part 'get_book_details_event.dart';
part 'get_book_details_state.dart';

class GetBookDetailsBloc
    extends Bloc<GetBookDetailsEvent, GetBookDetailsState> {
  GetBookDetailsBloc() : super(GetBookDetailsInitial()) {
    on<FirebaseBookEvent>(getBookDetails);
  }
  Future<void> getBookDetails(
    FirebaseBookEvent event,
    Emitter<GetBookDetailsState> emit,
  ) async {
    emit(GetBookDetailsLoading());
    print('salom');
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await FirebaseFirestore.instance.collection('books').get();

      print(snapshot.docs);
      for (var book in snapshot.docs) {

        BookDetailsModel bookDetailsModel = await BookDetailsModel.fromJson(
          book.data(),
        );

        HiveBoxes.book_details.put(bookDetailsModel.id, bookDetailsModel);
print(HiveBoxes.book_details.isNotEmpty);
      }

      if (snapshot.docs.isNotEmpty) {
        emit(GetBookDetailsSuccess());
      }
    } catch (e) {
      print('Error: somthing went wrong $e');
      emit(GetBookDetailsError(e.toString()));
    }
  }
}
