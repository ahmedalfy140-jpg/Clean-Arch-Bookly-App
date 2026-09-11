import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntity> featchFeaturBooks({int pageNumber =0});
  List<BookEntity> featchNewestBooks();
}

class HomeLocalDataSourceImple extends HomeLocalDataSource{
  @override
  List<BookEntity> featchFeaturBooks({int pageNumber =0 }) {
    int startIndex= pageNumber*10;
    int endIndex = (pageNumber+1)*10;
   var box =Hive.box<BookEntity>(kFeaturedBook);
   int length = box.values.length;
   if (startIndex >= length || endIndex >length){
    return [];
   }
   return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> featchNewestBooks() {
    var box =Hive.box<BookEntity>(kNewestBook);
    return box.values.toList();
  }
}