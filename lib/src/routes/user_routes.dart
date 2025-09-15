import 'package:flint_dart/flint_dart.dart';
import 'package:sample/src/middlewares/auth_middleware.dart';
import '../controllers/user_controller.dart';

void registerUserRoutes(Flint app) {
  final controller = UserController();

  /// @summary Register a new user
  /// @server http://localhost:3000
  /// @server https://api.mydomain.com

  app.get("/users", controller.index);

  /// @summary Get a user by ID
  /// @param id path integer required The ID of the user
  app.get("/:id", controller.show);

  /// @prefix /users
  /// @summary Create a new user
  /// @response 200 User registered successfully
  /// @body {"email": "string", "password": "string"}
  app.post('/', controller.create);

  /// @prefix /users

  app.put('/:id', AuthMiddleware().handle(controller.update));

  /// @prefix /users
  /// @auth
  app.delete('/:id', AuthMiddleware().handle(controller.delete));
}
