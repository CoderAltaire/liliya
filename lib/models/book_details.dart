import 'package:hive/hive.dart';

import '../hive_helper/adapters.dart';

part 'book_details.g.dart';

@HiveType(typeId: 2,adapterName: HiveAdapters.book_details)
class BookDetailsModel extends HiveObject {
  @HiveField(0)
  final String category;

  @HiveField(1)
  final int category_id;

  @HiveField(2)
  final String contributor;

  @HiveField(3)
  final String coverage;

  @HiveField(4)
  final String creator;

  @HiveField(5)
  final String date;

  @HiveField(6)
  final String description;

  @HiveField(7)
  final String format;

  @HiveField(8)
  final int id;

  @HiveField(9)
  final String identifier;

  @HiveField(10)
  final String img;

  @HiveField(11)
  final String language;

  @HiveField(12)
  final String publisher;

  @HiveField(13)
  final String relation;

  @HiveField(14)
  final String source;

  @HiveField(15)
  final String subject;

  @HiveField(16)
  final String title;

  @HiveField(17)
  final String type;

  BookDetailsModel({
    required this.category,
    required this.category_id,
    required this.contributor,
    required this.coverage,
    required this.creator,
    required this.date,
    required this.description,
    required this.format,
    required this.id,
    required this.identifier,
    required this.img,
    required this.language,
    required this.publisher,
    required this.relation,
    required this.source,
    required this.subject,
    required this.title,
    required this.type,
  });

  factory BookDetailsModel.fromJson(Map<String, dynamic> json) {
    // Extract the nested book_details map
    final bookDetails = json['book_details'] as Map<String, dynamic>? ?? json;

    return BookDetailsModel(
      title: bookDetails['title'] ?? 'no data',
      id: bookDetails['id'] ?? 0,
      category: bookDetails['category'] ?? 'no data',
      category_id: bookDetails['category_id'] ?? 0,
      creator: bookDetails['creator'] ?? 'no data',
      subject: bookDetails['subject'] ?? 'no data',
      description: bookDetails['description'] ?? 'no data',
      publisher: bookDetails['publisher'] ?? 'no data',
      contributor: bookDetails['contributor'] ?? 'no data',
      date: bookDetails['date'] ?? 'no data',
      type: bookDetails['type'] ?? 'no data',
      format: bookDetails['format'] ?? 'no data',
      identifier: bookDetails['identifier'] ?? 'no data',
      source: bookDetails['source'] ?? 'no data',
      language: bookDetails['language'] ?? 'no data',
      relation: bookDetails['relation'] ?? 'no data',
      coverage: bookDetails['coverage'] ?? 'no data',
      img: bookDetails['img'] ?? 'no data',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'id': id,
      'category': category,
      'category_id': category_id,
      'creator': creator,
      'subject': subject,
      'description': description,
      'publisher': publisher,
      'contributor': contributor,
      'date': date,
      'type': type,
      'format': format,
      'identifier': identifier,
      'source': source,
      'language': language,
      'relation': relation,
      'coverage': coverage,
      'img': img,
    };
  }
}
