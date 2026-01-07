import 'package:flint_dart/flint_dart.dart';
import 'package:sample/routes/app_routes.dart';

void main() {
  final app = Flint(
    withDefaultMiddleware: true,
    autoConnectDb: true,
    enableSwaggerDocs: true,
  );

  // Mount the main AppRoutes
  app.routes(AppRoutes());

  // Start the server
  app.listen(3000, hotReload: true);
}
