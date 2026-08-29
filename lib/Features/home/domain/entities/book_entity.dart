class BookEntity {
  final String bookid;
  final String title;
  final String? auther;
  final String? image;

  final num? rating;

  final String? saleability;
  final num? averageRatingbook;

  BookEntity(
      {required this.title,
      required this.auther,
      required this.image,
      required this.rating,
      required this.bookid,
      required this.saleability,required this.averageRatingbook});
}
