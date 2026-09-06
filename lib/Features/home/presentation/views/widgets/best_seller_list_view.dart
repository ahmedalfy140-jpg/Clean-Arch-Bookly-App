import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit,NewestBooksState>(builder: (context, state) {
      if (state is NewestBooksSuccess) {
        return SliverList(
          delegate:
              SliverChildBuilderDelegate(childCount: state.books.length, (context, index) {
            return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: BookListViewItem(book: state.books[index],),
            );
          }),
        );
      }else if ( state is NewestBooksFailure){
        return Center(child: Text(state.errMessage));
      }else {
        return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
