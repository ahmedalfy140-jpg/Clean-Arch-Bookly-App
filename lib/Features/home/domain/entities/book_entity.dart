import 'package:hive/hive.dart';
part 'book_entity.g.dart';
@HiveType(typeId: 0)
class BookEntity {
  @HiveField(0)
  final String bookid;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String? auther;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final num? rating;
  @HiveField(5)
  final String? saleability;
  @HiveField(6)
  final num? averageRatingbook;

  BookEntity(
      {required this.title,
      required this.auther,
      required this.image,
      required this.rating,
      required this.bookid,
      required this.saleability,
      required this.averageRatingbook});
}
