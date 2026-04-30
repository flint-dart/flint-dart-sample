import 'package:flint_dart/flint_dart.dart';
import 'package:sample/middlewares/auth_middleware.dart';
import '../controllers/user_controller.dart';

/// User API routes
class UserRoutes extends RouteGroup {
  @override
  String get prefix => '/users';

  @override
  List<Middleware> get middlewares =>
      []; // optional global middleware for this group

  @override
  void register(Flint app) {
    final users = app.controller(UserController.new);

    /// @summary Register a new user
    /// @server http://localhost:3000
    /// @server https://api.mydomain.com
    /// @response 200 User registered successfully
    /// @body {"email": "string", "password": "string"}
    /// @auth basicAuth
    users.post('/', (c) => c.create()).useMiddleware(AuthMiddleware());

    /// @summary Get all users
    /// @server http://localhost:3000
    /// @server https://api.mydomain.com
    users.get('/', (c) => c.index());

    /// @summary Get a user by ID
    /// @param id path integer required The ID of the user
    /// @server http://localhost:3000
    /// @server https://api.mydomain.com
    users.get('/:id', (c) => c.show());

    /// @summary Update a user by ID
    /// @param id path string required id parameter
    /// @body {"example": "string"}
    /// @query page integer optional Page number for pagination
    /// @query limit integer optional Number of items per page
    /// @query location string optional Filter by location
    /// @query type string optional Filter by school type
    /// @query curriculum string optional Filter by curriculum
    /// @query min_rating number optional Filter by minimum rating
    /// @auth bearer
    /// @response 200 Resource updated successfully
    /// @response 400 Bad request
    /// @response 401 Unauthorized
    /// @response 500 Internal server error
    users.put('/:id', (c) => c.update()).useMiddleware(AuthMiddleware());

    /// @summary Delete a user by ID
    /// @param id path string required id parameter
    /// @auth bearer
    /// @response 200 Resource deleted successfully
    /// @response 400 Bad request
    /// @response 401 Unauthorized
    /// @response 500 Internal server error
    users.delete('/:id', (c) => c.delete()).useMiddleware(AuthMiddleware());
  }
}
