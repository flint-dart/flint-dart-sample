import 'package:flint_dart/flint_ui.dart';

import '../components/auth/auth_page_shell.dart';

class LoginPage extends AuthPageShell {
  LoginPage(super.props);

  @override
  String get mode => 'Login';

  @override
  String get primaryAction => 'Sign in';

  @override
  String get switchLabel => 'Create account';

  @override
  String get switchHref => '/register';

  @override
  List<View> fields() {
    return [
      field('Email address', 'email', 'email', 'you@company.com'),
      field('Password', 'password', 'password', 'Enter password'),
    ];
  }
}
