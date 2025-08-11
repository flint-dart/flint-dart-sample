import 'package:flint_dart/flint_dart.dart';

class ValidationMiddleware extends Middleware {
  final Map<String, String> rules;

  ValidationMiddleware(this.rules);

  @override
  Handler handle(Handler next) {
    return (Request req, Response res) async {
      try {
        final data = await req.json();
        await Validator.validate(data, rules);
        await next(req, res);
      } catch (e) {
        res.status(400).json({'error': e.toString()});
      }
    };
  }
}
