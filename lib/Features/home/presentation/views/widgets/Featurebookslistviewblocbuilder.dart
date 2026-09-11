
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_books_state.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Featurebookslistviewblocbuilder extends StatefulWidget {
  const Featurebookslistviewblocbuilder({
    super.key,
  });

  @override
  State<Featurebookslistviewblocbuilder> createState() => _FeaturebookslistviewblocbuilderState();
}

class _FeaturebookslistviewblocbuilderState extends State<Featurebookslistviewblocbuilder> {
  List<BookEntity> books=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeatureBookCubit, FeatureBooksState>(
      listener: (context, state) {
        if(state is FeatureBookSuccess){
          books.addAll(state.books);

        }
        if (state is FeatureBookPaginiationFaiure){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (BuildContext context, state) {
       if (state is FeatureBookSuccess|| state is FeatureBookPaginiationLoading|| state is FeatureBookPaginiationFaiure){
         return   FeaturedBooksListView(books:books,);
       }else if ( state is FeatureBookFailure){
        return Text(state.errMessage);
       }else {
        return const Center(child: CircularProgressIndicator());
       }
      },
    );
  }
}
