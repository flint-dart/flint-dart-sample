// src/routes/app_routes.dart
import 'package:flint_dart/flint_dart.dart';
import 'package:sample/controllers/auth_controller.dart';
import 'package:sample/controllers/sample_controller.dart';
import 'auth_routes.dart';
import 'sample_api_routes.dart';
import 'user_routes.dart';

/// Main route group for the entire app
class AppRoutes extends RouteGroup {
  @override
  String get prefix => ''; // root

  @override
  List<Middleware> get middlewares => []; // optional global middlewares

  @override
  void register(Flint app) {
    app.get('/', (Context ctx) async {
      return ctx.res?.page(
        'Welcome',
        title: 'Welcome to Flint Dart',
        props: _welcomeProps(),
      );
    });

    app.get('/welcome', (Context ctx) async {
      return ctx.res?.page(
        'Welcome',
        title: 'Welcome to Flint Dart',
        props: _welcomeProps(),
      );
    });

    app.get('/dashboard', (Context ctx) async {
      if (!AuthController.isSampleToken(ctx.req.authToken)) {
        return ctx.res?.redirect('/login?next=/dashboard');
      }

      return ctx.res?.page(
        'Dashboard',
        title: 'Flint Dashboard',
        props: SampleController.dashboardData(),
      );
    });

    app.get('/login', (Context ctx) async {
      return ctx.res?.page(
        'Login',
        title: 'Login',
        props: {
          'headline': 'Welcome back',
          'subtitle': 'Sign in to continue to your Flint workspace.',
          'endpoint': '/auth/login',
        },
      );
    });

    app.get('/register', (Context ctx) async {
      return ctx.res?.page(
        'Register',
        title: 'Create account',
        props: {
          'headline': 'Create your workspace',
          'subtitle':
              'Start with a clean Flint dashboard in less than a minute.',
          'endpoint': '/auth/register',
        },
      );
    });

    // Auth routes
    app.routes(AuthRoutes());

    // Sample JSON APIs consumed by the Flint UI frontend.
    app.routes(SampleApiRoutes());

    // User routes with optional middleware
    app.routes(
      UserRoutes(),
      children: [],
    );
  }

  Map<String, dynamic> _welcomeProps() {
    return SampleController.welcomeData();
  }
}
