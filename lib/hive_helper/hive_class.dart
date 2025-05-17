import 'package:com.example.liliya/hive_helper/hive_names.dart';
import 'package:com.example.liliya/models/book_details.dart';
import 'package:com.example.liliya/models/user_data.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pp;

class HiveService {
  const HiveService._();
  static Future<void> init() async {
    final dir = await pp.getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    // Hive.registerAdapter();
    Hive.registerAdapter(BookDetailsModelAdapter());
    Hive.registerAdapter(UserDataAdapter());


    await Hive.openBox<BookDetailsModel>(HiveBoxNames.book_details);
    await Hive.openBox<UserData>(HiveBoxNames.userdatas);
  }
}
