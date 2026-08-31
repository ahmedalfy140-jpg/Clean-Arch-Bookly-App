import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturBooks();
  List<BookEntity> featchNewestBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource{
  @override
  List<BookEntity> featchFeaturBooks() {
   var box =Hive.box<BookEntity>(kFeaturedBook);
   return box.values.toList();
  }

  @override
  List<BookEntity> featchNewestBooks() {
    var box =Hive.box<BookEntity>(kNewestBook);
    return box.values.toList();
  }
}