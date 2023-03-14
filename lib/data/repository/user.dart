import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  late String uid;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String displayName;

  User({required this.uid, required this.email, required this.displayName});
}
