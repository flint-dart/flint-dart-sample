import 'package:flint_dart/flint_dart.dart';
import 'package:sample/controllers/sample_controller.dart';

class SampleApiRoutes extends RouteGroup {
  @override
  String get prefix => '/api';

  @override
  List<Middleware> get middlewares => [];

  @override
  void register(Flint app) {
    final sample = app.controller(SampleController.new);

    sample.get('/welcome', (c) => c.welcome());
    sample.get('/dashboard', (c) => c.dashboard());
  }
}
