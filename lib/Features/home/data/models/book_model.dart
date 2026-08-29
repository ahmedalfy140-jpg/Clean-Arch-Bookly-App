
import 'package:bookly/Features/home/domain/entities/book_entity.dart';

class BookModel extends BookEntity{
  
  final String id;
  final String booktitle;
  final String? author;
  final String? description;
  final String bookimage;
  final double? averageRating;
  final num? ratingCount;
  final String? saleabilitybook;


  BookModel({
    required this.id,
    required this.booktitle,
    this.author,
    this.description,
    required this.bookimage,
    this.averageRating,
    this.ratingCount,
    this.saleabilitybook
  }) : super(title: booktitle, auther: author, image:bookimage,averageRatingbook: averageRating, rating: ratingCount, bookid: id,saleability: saleabilitybook);

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'] ?? {};
     

    return BookModel(
      id: json['id'] ?? '',
      booktitle: volumeInfo['title'] ?? 'Unknown',

      // authors is a List<String>
      author: volumeInfo['authors'] != null &&
              (volumeInfo['authors'] as List).isNotEmpty
          ? volumeInfo['authors'][0]
          : 'Unknown',

      description: volumeInfo['description'],

      // imageLinks can be missing
      bookimage: volumeInfo['imageLinks']?['thumbnail'],

      saleabilitybook: json['saleInfo']['saleability']??'Free',

      // These fields may not exist in every Google Books response
      averageRating: volumeInfo['averageRating'] != null
          ? (volumeInfo['averageRating'] as num).toDouble()
          : null,

      ratingCount: volumeInfo['ratingsCount'],
    );
  }
}

