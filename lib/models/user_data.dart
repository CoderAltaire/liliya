import 'package:hive/hive.dart';

import '../hive_helper/adapters.dart';

part 'user_data.g.dart';

@HiveType(typeId: 3,adapterName: HiveAdapters.user_data)
class UserData extends HiveObject {
  @HiveField(0)
  final String firstname;

  @HiveField(1)
  final String lastname;

  UserData(this.firstname, this.lastname);


  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      json['firstname'] as String,
      json['lastname'] as String,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'firstname': firstname,
      'lastname': lastname,
    };
  }
}
