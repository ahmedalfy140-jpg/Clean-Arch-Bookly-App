import 'package:bookly/Features/home/domain/use_cases/featch_feature_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureBookCubit extends Cubit<FeatureBooksState> {
  FeatureBookCubit(this.featchFeatureBooksUseCase) : super(FeatureBookInitial());
  final FeatchFeatureBooksUseCase featchFeatureBooksUseCase;
  Future<void> fetchFeatureBooks() async {
    emit(FeatureBookLoading());
    var result = await featchFeatureBooksUseCase.call();
    result.fold(
      (failure) {
        emit(FeatureBookFailure(failure.errorMessage));
      },
      (books) {
        emit(FeatureBookSuccess(books));
      },
    );
  }
}
