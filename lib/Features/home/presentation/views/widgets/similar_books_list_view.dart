import 'package:bookly/Features/home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';

import 'custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key, });
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .15,
      child: ListView.builder(
        itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: CustomBookImage(image:  '',),
            );
          }),
    );
  }
}
