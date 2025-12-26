import 'package:flint_dart/model.dart';
import 'package:flint_dart/schema.dart';

class User extends Model<User> {
  User() : super(() => User());

  String get name => getAttribute("name");
  String get email => getAttribute("name");
  String get password => getAttribute("password");
  String get profilePicUrl => getAttribute("profilePicUrl");

  @override
  Table get table => Table(
        name: 'users',
        columns: [
          Column(name: 'name', type: ColumnType.string, length: 255),
          Column(name: 'email', type: ColumnType.string, length: 255),
          Column(
            name: 'password',
            type: ColumnType.string,
          ),
          Column(
            name: 'profilePicUrl',
            type: ColumnType.string,
          ),
        ],
      );
}
