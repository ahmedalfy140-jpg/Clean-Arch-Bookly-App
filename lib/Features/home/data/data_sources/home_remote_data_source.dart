import 'package:bookly/Features/home/data/models/book_model.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/constants.dart';

import 'package:bookly/core/utils/api_services.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> featchFeaturBooks();
  Future<List<BookEntity>> featchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource{
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl(this.apiServices);
  @override
  Future<List<BookEntity>> featchFeaturBooks()async {
    var data = await apiServices.get(endpoint: 'flutter');

    List<BookEntity> books = getBooksList(data);
    // cached featured books
    saveData(books,kFeaturedBook);
    return books;
  }

 

 

  @override
  Future<List<BookEntity>> featchNewestBooks()async {
    var data = await apiServices.get(endpoint: 'flutter',orderBy: 'newest');

    List<BookEntity> books = getBooksList(data);
    // cache newest books 
      saveData(books,kNewestBook);
     

    return books;
 
  }
   List<BookEntity> getBooksList(Map<String, dynamic> data) {
     List<BookEntity> books= [];
    for (var item in data['items']) {
      books.add(BookModel.fromJson(item));
      
    }
    return books;
  }
  // save box data function
   void saveData(List<BookEntity> books, String boxName) {
      var box=Hive.box(boxName);
    box.addAll(books);
  }
}
