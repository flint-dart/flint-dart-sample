import 'package:flint_dart/flint_dart.dart';
import 'package:sample/src/controllers/auth_controller.dart';

void authRoutes(Flint app) {
  final authController = AuthController();

  /// @summary Endpoint description
  /// @auth bearer
  /// @response 200 Success response description
  /// @response 400 Bad request
  /// @response 401 Unauthorized
  /// @response 500 Internal server error
  /// @param id path string required Parameter description
  /// @body {"field1": "string", "field2": "string"}
  app.post("/register", authController.register);

  /// @summary Endpoint description
  /// @auth bearer
  /// @response 200 Success response description
  /// @response 400 Bad request
  /// @response 401 Unauthorized
  /// @response 500 Internal server error
  /// @param id path string required Parameter description
  /// @body {"field1": "string", "field2": "string"}
  app.post("/login", authController.login);

  /// @summary Create /login-with-google
  /// @auth bearer
  /// @response 200 Resource created successfully
  /// @response 400 Bad request
  /// @response 401 Unauthorized
  /// @response 500 Internal server error
  /// @body {"example": "string"}
  app.post("/login-with-google", authController.login);
}
