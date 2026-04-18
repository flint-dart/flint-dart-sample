import 'package:flint_dart/flint_dart.dart';
import '../seeders/user_model_seeder.dart';

/// This registry is the canonical entry point for database seeders.
///
/// Flint's `flint --db-seed` command runs this file, and
/// `flint make:seeder ...` updates this registry automatically.
Future<void> main() async {
  await runSeeders([
    UserModelSeeder(),
  ]);
}
