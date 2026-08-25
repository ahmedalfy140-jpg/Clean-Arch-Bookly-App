import 'package:bookly/Features/home/domain/entities/home_entity.dart';

abstract class HomeRepo {
  Future <List<BookEntity>> featchFeaturBooks();
   Future <List<BookEntity>> featchNewestBooks();
}