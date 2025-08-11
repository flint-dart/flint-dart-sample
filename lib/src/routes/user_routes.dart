import 'package:flint_dart/flint_dart.dart';
import 'package:sample/src/middlewares/auth_middleware.dart';
import '../controllers/user_controller.dart';

void registerUserRoutes(Flint app) {
  final controller = UserController();

  app.get('/', controller.index);
  app.get('/:id', controller.show);
  app.post('/', controller.create);
  app.put('/:id', AuthMiddleware().handle(controller.update));
  app.delete('/:id', AuthMiddleware().handle(controller.delete));
}
