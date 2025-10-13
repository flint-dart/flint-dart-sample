import 'package:flint_dart/model.dart';
import 'package:flint_dart/schema.dart';

class User extends Model<User> {
  String? id;
  String? name;
  String? email;
  String? password;
  String? profilePicUrl;

  @override
  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
      };

  @override
  User fromMap(Map<dynamic, dynamic> map) => User()
    ..id = map['id']
    ..name = map['name']
    ..email = map['email']
    ..password = map["password"];

  @override
  Table get table => Table(
        name: 'users',
        columns: [
          Column(
              name: 'id',
              type: ColumnType.integer,
              isPrimaryKey: true,
              isAutoIncrement: true),
          Column(name: 'name', type: ColumnType.string, length: 255),
          Column(name: 'email', type: ColumnType.string, length: 255),
          Column(
            name: 'password',
            type: ColumnType.string,
          ),
          Column(
              name: 'created_at', type: ColumnType.datetime, isNullable: true),
        ],
      );
}
