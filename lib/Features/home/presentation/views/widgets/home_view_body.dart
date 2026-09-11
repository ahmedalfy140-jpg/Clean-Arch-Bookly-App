import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/featurebookslistviewblocbuilder.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_seller_list_view.dart';
import 'custom_app_bar.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController _scrollController ;
 var nextPage =1;
 var isLoading=false;
  @override
  void initState(){
    super.initState();
    _scrollController=ScrollController();
    _scrollController.addListener(_scrollListener);

  }
  void _scrollListener()async{
    var currentPosition= _scrollController.position.pixels;
    var maxScrollLength=_scrollController.position.maxScrollExtent;
    if(currentPosition>=0.7* maxScrollLength){
      if (!isLoading) {
        isLoading=true;
       await BlocProvider.of<NewestBooksCubit>(context).fetchNewestBooks(pageNumber:nextPage++ );
        isLoading=false;
      }
    }
  }
  @override
  void dispose(){
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        controller: _scrollController,
        slivers: const [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: CustomAppBar()),
                Featurebookslistviewblocbuilder(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'New book',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          BestSellerListView(),
         
        ],
      ),
    );
  }
}

