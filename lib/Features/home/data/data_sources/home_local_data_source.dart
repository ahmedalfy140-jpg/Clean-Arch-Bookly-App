import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturBooks();
  List<BookEntity> featchNewestBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource{
  @override
  List<BookEntity> featchFeaturBooks() {
    // TODO: implement featchFeaturBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntity> featchNewestBooks() {
    // TODO: implement featchNewestBooks
    throw UnimplementedError();
  }
}