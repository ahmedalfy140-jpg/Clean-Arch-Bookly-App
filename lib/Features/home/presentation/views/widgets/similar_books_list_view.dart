import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, });

  

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBookCubit,FeatureBooksState>(builder: (context,state){
      if (state is FeatureBookSuccess){
        return SizedBox(
        height: MediaQuery.of(context).size.height * .15,
        child: ListView.builder(
          itemCount: state.books.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return   Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: CustomBookImage(image: state.books[index].image),
              );
            }),
      );
      }else if (state is FeatureBookFailure){
        return Text(state.errMessage);

      }else {
        return const Center(child: CircularProgressIndicator());
      }

    },
      
    );
  }
}
