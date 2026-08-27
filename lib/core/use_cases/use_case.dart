import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase <T,parameter>{
  Future<Either<Failure,T>> call ([parameter parameter]);

}
class NoParameter{}