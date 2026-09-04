// import 'package:bookly/Features/home/presentation/manger/search_view_cubit/search_view_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class SearchBooksCubit extends Cubit<SearchBookState> {
 
//   SearchBooksCubit( {required this.bookService}) : super(SearchViewStateInitial());



//   final BookService bookService;

  

//   Future<void> searchBooks(String query) async {
//     if (query.trim().isEmpty) {
//       emit(SearchViewStateInitial());
//       return;
//     }

//     emit(SearchViewStateLoading());

//     try {
//       final data = await bookService.fetchBooks(
        
//       );

//       final List booksData = data['items'] ?? [];

//       final books = booksData
//           .map((book) => BookModel.fromJson(book))
//           .toList();

//       emit(SearchViewStateSuccess(books ));
//     } catch (e) {
//       emit(SearchViewStateFailure(e.toString()));
//     }
//   }
// }