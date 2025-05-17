import 'package:com.example.liliya/models/book_details.dart';
import 'package:com.example.liliya/models/user_data.dart';

import 'package:hive/hive.dart';

class HiveBoxes {
  const HiveBoxes._();

  static final Box<BookDetailsModel> book_details = Hive.box(
    HiveBoxNames.book_details,
  );
  static final Box<UserData> userdatas = Hive.box(HiveBoxNames.userdatas);


  static Future<void> clearAllBoxes() async {
    await Future.wait([]);
    book_details.clear();
    userdatas.clear();

  }
}

class HiveBoxNames {
  static const String book_details = "book_detail";
  static const String userdatas = "userdatas";

}
