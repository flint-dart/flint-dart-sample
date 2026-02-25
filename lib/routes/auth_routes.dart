import 'package:flint_dart/flint_dart.dart';
import 'package:sample/controllers/auth_controller.dart';

/// Auth API routes
class AuthRoutes extends RouteGroup {
  @override
  String get prefix => '/auth';

  @override
  List<Middleware> get middlewares =>
      []; // optional global middleware for this group

  @override
  void register(Flint app) {
    /// @summary Register a new user
    /// @auth bearer
    /// @response 200 Success response description
    /// @response 400 Bad request
    /// @response 401 Unauthorized
    /// @response 500 Internal server error
    /// @body {"field1": "string", "field2": "string"}
    app.post(
      '/register',
      useController(AuthController.new, (c) => c.register()),
    );

    /// @summary Login user
    /// @auth bearer
    /// @response 200 Success response description
    /// @response 400 Bad request
    /// @response 401 Unauthorized
    /// @response 500 Internal server error
    /// @body {"field1": "string", "field2": "string"}
    app.post(
      '/login',
      useController(AuthController.new, (c) => c.login()),
    );

    /// @summary Login with Google
    /// @auth bearer
    /// @response 200 Resource created successfully
    /// @response 400 Bad request
    /// @response 401 Unauthorized
    /// @response 500 Internal server error
    /// @body {"example": "string"}
    app.post(
      '/login-with-google',
      useController(AuthController.new, (c) => c.loginWithGoogle()),
    );
  }
}
