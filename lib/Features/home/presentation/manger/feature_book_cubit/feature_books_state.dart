
import 'package:bookly/Features/home/domain/entities/book_entity.dart';

abstract class FeatureBooksState {}

class FeatureBookInitial extends FeatureBooksState {}
class FeatureBookLoading extends FeatureBooksState {}
class FeatureBookFailure extends FeatureBooksState {final String errMessage ;

  FeatureBookFailure(this.errMessage); }
class FeatureBookSuccess extends FeatureBooksState {
  final List <BookEntity> books;

  FeatureBookSuccess(this.books);
}
  
