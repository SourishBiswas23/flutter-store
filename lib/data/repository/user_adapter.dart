import 'package:hive/hive.dart';

import 'user.dart';

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 0;

  @override
  User read(BinaryReader reader) {
    final uid = reader.readString();
    final email = reader.readString();
    final displayName = reader.readString();

    return User(uid: uid, email: email, displayName: displayName);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeString(obj.uid);
    writer.writeString(obj.email);
    writer.writeString(obj.displayName);
  }
}
