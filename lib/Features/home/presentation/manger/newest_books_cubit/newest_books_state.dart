import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class NewestBooksState {}
  


  class NewestBooksInitail extends NewestBooksState{}
  class NewestBooksLoading extends NewestBooksState{}
  class NewestBooksFailure extends NewestBooksState{
    final String errMessage;

  NewestBooksFailure(this.errMessage);

  
  }
  class NewestBooksSuccess extends NewestBooksState{
    final List<BookEntity>books;

  NewestBooksSuccess(this.books);
  }
