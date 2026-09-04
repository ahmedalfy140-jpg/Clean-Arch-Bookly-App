
import 'package:bookly/Features/home/domain/use_cases/featch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.featchNewestBooksUseCase) : super(NewestBooksInitail());
  final FeatchNewestBooksUseCase featchNewestBooksUseCase;
  Future <void> fetchNewestBooks ()async{
    emit(NewestBooksLoading());
    var result = await featchNewestBooksUseCase.call();
    result.fold((failure){
      emit(NewestBooksFailure(failure.errorMessage));
    }, (books){
      emit(NewestBooksSuccess(books));
    });
  }
 

 
  }

