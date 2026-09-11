import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_list_view_item.dart';

class BestSellerListView extends StatefulWidget {
  const BestSellerListView({super.key});

  @override
  State<BestSellerListView> createState() => _BestSellerListViewState();
}

class _BestSellerListViewState extends State<BestSellerListView> {
  List<BookEntity> books=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
       listener: (context, state) {
        if(state is NewestBooksSuccess){
          books.addAll(state.books);

        }
        if (state is NewsetBookPaginiationFaiure){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
        builder: (context, state) {
      if (state is NewestBooksSuccess|| state is NewestBookPaginiationLoading || state is NewsetBookPaginiationFaiure) {
        return
         SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: books.length,
            (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(
                  book: books[index],
                ),
              );
            },
          ),
        );
      } else if (state is NewestBooksFailure) {
        return Center(child: Text(state.errMessage));
      } else {
        return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()));
      }
    });
  }
}
