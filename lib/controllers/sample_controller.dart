import 'package:flint_dart/flint_dart.dart';
import 'package:sample/controllers/auth_controller.dart';

class SampleController extends Controller {
  Future<Response> welcome() async {
    return res.json({
      "status": "success",
      "data": welcomeData(),
    });
  }

  Future<Response> dashboard() async {
    if (!AuthController.isSampleToken(req.authToken)) {
      return res.status(401).json({
        "status": "error",
        "message": "Authentication required.",
      });
    }

    final data = dashboardData();
    if (req.method == 'QUERY') {
      final body = await _dashboardQueryBody();
      data['queryExample'] = {
        'method': req.method,
        'body': body,
        'queryParameters': Map<String, dynamic>.from(req.query),
      };
      data['activity'] = [
        {
          'title': 'Flint UI used QUERY with a JSON body',
          'time': body['range']?.toString() ?? 'today',
          'color': '#7c3aed',
        },
        ...(data['activity'] as List<Map<String, String>>),
      ];
    }

    return res.json({
      "status": "success",
      "data": data,
    });
  }

  Future<Map<String, dynamic>> _dashboardQueryBody() async {
    try {
      return await req.json();
    } on FormatException {
      return {};
    }
  }

  static Map<String, dynamic> welcomeData() {
    return {
      'version': '1.1.11',
      'tagline':
          'FlintDart lets you build expressive APIs and modern browser pages with Flint UI components, DartStyle, typed gradients, and page bundles.',
      'tests': [
        {'label': 'Backend routes', 'value': '6'},
        {'label': 'UI pages', 'value': '4'},
        {'label': 'Flint UI', 'value': '0.1.8'},
      ],
    };
  }

  static Map<String, dynamic> dashboardData() {
    return {
      'name': 'Aim',
      'metrics': [
        {'label': 'Revenue', 'value': 'NGN 8.4m', 'delta': '+18.2%'},
        {'label': 'Active users', 'value': '1,284', 'delta': '+9.7%'},
        {'label': 'Tasks closed', 'value': '342', 'delta': '+24'},
      ],
      'activity': [
        {
          'title': 'Frontend consumed /api/dashboard',
          'time': 'just now',
          'color': '#0f766e',
        },
        {
          'title': 'Auth forms wired to /auth',
          'time': 'today',
          'color': '#2563eb',
        },
        {
          'title': 'Flint UI build verified',
          'time': 'today',
          'color': '#be123c',
        },
      ],
    };
  }
}
