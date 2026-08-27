import 'package:bookly/Features/home/domain/entities/home_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/use_cases/use_case.dart';
import 'package:dartz/dartz.dart';

class FeatchFeatureBooksUseCase extends UseCase<List<BookEntity>,NoParameter> {
  final HomeRepo homeRepo;

  FeatchFeatureBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([NoParameter? parameter]) async{
   
   return await homeRepo.featchFeaturBooks();
  }

 
  
}



