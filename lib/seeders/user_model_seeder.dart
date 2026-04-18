import 'package:flint_dart/flint_dart.dart';
import 'package:sample/models/user_model.dart';

class UserModelSeeder extends Seeder {
  @override
  Future<void> run() async {
    await User().create({
      'name': 'Ada Lovelace',
      'email': 'ada@example.com',
      'password': 'secret123',
      'profilePicUrl': 'https://example.com/images/ada.png',
    });

    Log.debug('Seeded default sample user.');
  }
}
