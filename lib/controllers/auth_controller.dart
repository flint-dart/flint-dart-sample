import 'package:flint_dart/flint_dart.dart';

class AuthController extends Controller {
  static final Map<String, Map<String, dynamic>> _sampleUsers = {
    'demo@flintdart.dev': {
      'id': 'sample-user',
      'name': 'Flint Demo',
      'email': 'demo@flintdart.dev',
      'password': 'password',
      'workspace': 'Flint HQ',
    },
  };

  Future<Response> register() async {
    try {
      final body = await req.json();
      await Validator.validate(body, {
        "email": "required|email",
        "name": "required|string|min:2|max:80",
        "password": "required|string|min:6",
      });

      final email = body['email'].toString().toLowerCase().trim();
      if (_sampleUsers.containsKey(email)) {
        return res.status(409).json({
          "status": "error",
          "message": "A sample account already exists for this email.",
          "errors": {
            "email": ["A sample account already exists for this email."]
          },
        });
      }

      final user = {
        'id': 'user-${DateTime.now().millisecondsSinceEpoch}',
        'name': body['name'].toString().trim(),
        'email': email,
        'password': body['password'].toString(),
        'workspace': '${body['name'].toString().trim()} Workspace',
      };
      _sampleUsers[email] = user;

      res.setCookie(
        'auth.token',
        'sample-token-${user['id']}',
        maxAge: 60 * 60 * 8,
      );
      return res.json({
        "status": "success",
        "message": "Workspace created.",
        "data": _authPayload(user),
      });
    } on ValidationException catch (e) {
      return res.status(422).json({"status": "error", "errors": e.errors});
    } catch (e) {
      return res.status(500).json(
        {"status": "error", "message": e.toString()},
      );
    }
  }

  Future<Response> login() async {
    try {
      final body = await req.json();

      await Validator.validate(
        body,
        {"email": "required|email", "password": "required|string"},
      );

      final email = body['email'].toString().toLowerCase().trim();
      final user = _sampleUsers[email];

      if (user == null || user['password'] != body['password']) {
        return res.status(401).json({
          "status": "error",
          "message": "Invalid email or password.",
          "errors": {
            "email": ["Use demo@flintdart.dev / password or register first."]
          },
        });
      }

      res.setCookie(
        'auth.token',
        'sample-token-${user['id']}',
        maxAge: 60 * 60 * 8,
      );
      return res.json({
        "status": "success",
        "message": "Signed in.",
        "data": _authPayload(user),
      });
    } on ValidationException catch (e) {
      return res.status(422).json({"status": "error", "errors": e.errors});
    } catch (e) {
      return res.status(500).json({"status": "error", "message": e.toString()});
    }
  }

  Future<Response> me() async {
    final token = req.authToken;
    final user = _userFromToken(token);
    if (user == null) {
      return res.status(401).json({
        "status": "error",
        "message": "Authentication required.",
      });
    }

    return res.json({
      "status": "success",
      "data": _publicUser(user),
    });
  }

  Map<String, dynamic> _authPayload(Map<String, dynamic> user) {
    return {
      "token": "sample-token-${user['id']}",
      "user": _publicUser(user),
    };
  }

  Map<String, dynamic> _publicUser(Map<String, dynamic> user) {
    return {
      "id": user['id'],
      "name": user['name'],
      "email": user['email'],
      "workspace": user['workspace'],
    };
  }

  static bool isSampleToken(String? token) {
    return _userFromToken(token) != null;
  }

  static Map<String, dynamic>? _userFromToken(String? token) {
    if (token == null || token.isEmpty) return null;
    for (final user in _sampleUsers.values) {
      if (token == 'sample-token-${user['id']}') return user;
    }
    return null;
  }

  Future<Response> loginWithGoogle() async {
    try {
      final user = _sampleUsers['demo@flintdart.dev']!;
      res.setCookie(
        'auth.token',
        'sample-token-${user['id']}',
        maxAge: 60 * 60 * 8,
      );
      return res.json({
        "status": "success",
        "message": "Google login placeholder for the sample app.",
        "data": _authPayload(user),
      });
    } catch (e) {
      return res.status(401).json({"status": "error", "message": e.toString()});
    }
  }

  Future<Response> update() async {
    return res.send('Updating item ${req.params['id']}');
  }

  Future<Response> delete() async {
    return res.send('Deleting item ${req.params['id']}');
  }
}
