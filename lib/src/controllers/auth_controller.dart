import 'package:flint_dart/auth.dart';
import 'package:flint_dart/flint_dart.dart';
import 'package:sample/src/models/user_model.dart';

class AuthController {
  Future<void> register(Request req, Response res) async {
    try {
      final body = await req.json();
      await Validator.validate(body, {
        "email": "required|string|email|min:3",
        "name": "required|string|min:5",
        "password": "required|string|min:8"
      });
      String hashPassword = Hashing().hash(body["password"]);
      body["password"] = hashPassword;
      final User user = await User().create(body);

      res.json({"status": "success", "data": user.toMap()});
    } on ValidationException catch (e) {
      res.status(422).json({"status": "errors", "errors": e.errors});
    } catch (e) {
      res.status(422).json(
        {"status": "error", "message": e.toString()},
      );
    }
  }

  Future<void> login(Request req, Response res) async {
    try {
      var body = await req.json();

      Validator.validate(
          body, {"email": "required|string", "password": "required|string"});

      final token = await Auth.login(body['email'], body["password"]);

      res.json({
        "status": "successfull",
        "data": {"token": token}
      });
    } on ValidationException catch (e) {
      res.status(422).json({"status": "errors", "errors": e});
    } catch (e) {
      res.status(422).json({"status": "errors", "errors": e.toString()});
    }
  }

  Future<void> loginWithGoogle(Request req, Response res) async {
    try {
      final body = await req.json();

      // Check if idToken or code is present and validate
      await Validator.validate(body,
          {"idToken": "string", "code": "string", "callbackPath": "string"});

      // Pass either idToken or code to the Auth class
      final Map<String, dynamic> authResult = await Auth.loginWithGoogle(
        idToken: body['idToken'],
        code: body['code'],
        callbackPath: body['callbackPath'],
      );

      res.json({
        "status": "success",
        "data": authResult,
      });
    } on ArgumentError catch (e) {
      res.status(400).json({"status": "error", "message": e.message});
    } on ValidationException catch (e) {
      res.status(400).json({"status": "error", "message": e.errors});
    } catch (e) {
      res.status(401).json({"status": "error", "message": e.toString()});
    }
  }

  Future<void> update(Request req, Response res) async {
    res.send('Updating item ${req.params['id']}');
  }

  Future<void> delete(Request req, Response res) async {
    res.send('Deleting item ${req.params['id']}');
  }
}
