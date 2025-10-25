import 'package:flint_dart/model.dart';
import 'package:flint_dart/schema.dart';

class PostModel extends Model<PostModel> {
  @override
  String? id; // 🚀 Framework automatically manages: id, created_at, updated_at

  // Define your custom fields here
  String? field1;
  String? field2;
  DateTime? createdAt;

  @override
  Table get table => Table(
        name: 'table_name',
        columns: [
          // 💡 Only define custom fields - id/created_at/updated_at are auto-added
          Column(name: 'field1', type: ColumnType.string),
          Column(name: 'field2', type: ColumnType.string),
        ],
      );

  @override
  Map<String, dynamic> toMap() =>
      {'id': id, 'field1': field1, 'field2': field2, "created_at": createdAt};

  @override
  PostModel fromMap(Map<String, dynamic> map) {
    return PostModel()
      ..id = map['id']
      ..field1 = map['field1']
      ..field2 = map['field2']
      ..createdAt = map["created_at"];
  }
}
