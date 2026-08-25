import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class FeatchFeatureBooksUseCase {
  final HomeRepo homeRepo;

  FeatchFeatureBooksUseCase(this.homeRepo);
  Future <Either<Failure,List<BookEntity>>> featchFeaturBooks(){
   return homeRepo.featchFeaturBooks();
  }
}