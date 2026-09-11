import 'package:bookly/Features/home/domain/use_cases/featch_feature_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBooksState> {
  FeatureBookCubit(this.featchFeatureBooksUseCase)
      : super(FeatureBookInitial());
  final FeatchFeatureBooksUseCase featchFeatureBooksUseCase;
  Future<void> fetchFeatureBooks({int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(
        FeatureBookLoading(),
      );
    } else {
      emit(FeatureBookPaginiationLoading());
    }
    var result = await featchFeatureBooksUseCase.call(pageNumber);
    result.fold(
      (failure) {
        if (pageNumber == 0) {
          emit(
            FeatureBookFailure(failure.errorMessage),
          );
        } else {
          emit(
            FeatureBookPaginiationFaiure(failure.errorMessage),
          );
        }
      },
      (books) {
        emit(FeatureBookSuccess(books));
      },
    );
  }
}
