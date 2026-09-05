import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:bookly/Features/home/domain/use_cases/featch_feature_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/featch_newest_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manger/feature_book_cubit/feature_book_cubit.dart';
import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/bloc_observer.dart';
import 'package:bookly/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {

  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  setupServiceLocator();

  await Hive.openBox(kFeaturedBook);
  await Hive.openBox(kNewestBook);
  Bloc.observer=SimpleBlocObserver();
    runApp(const Bookly());
}

final getIt = GetIt.instance;

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) {
          return FeatureBookCubit(
            FeatchFeatureBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          );
        }),
           BlocProvider(create: (context) {
          return NewestBooksCubit(
            FeatchNewestBooksUseCase(
              getIt.get<HomeRepoImpl>(),
            ),
          );
        }),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
