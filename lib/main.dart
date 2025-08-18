import 'package:flint_dart/flint_dart.dart';
import 'package:sample/src/middlewares/auth_middleware.dart';
import 'package:sample/src/routes/auth_routes.dart';
import 'package:sample/src/routes/user_routes.dart';

void main() {
  final app = Flint();

  app.get('/', (req, res) async {
    res.send('Hello from FlintDart hs!');
  });
  app.mount("/users", registerUserRoutes, middlewares: [
    AuthMiddleware(),
  ]);

  app.mount("/auth", authRoutes);

  app.listen(3000);
}
