import 'package:flint_dart/flint_dart.dart';
import 'package:sample/src/middlewares/auth_middleware.dart';
import 'package:sample/src/routes/auth_routes.dart';
import 'package:sample/src/routes/user_routes.dart';

void main() {
  final app = Flint(
    withDefaultMiddleware: true,
  );

  app.get('/', (req, res) async {
    return res.send('Hello from FlintDart!');
  });
  app.mount("/users", registerUserRoutes, middlewares: [
    AuthMiddleware(),
  ]);

  
  app.mount("/auth", authRoutes);
  app.listen(3000);
}
