import 'package:flint_dart/flint_ui.dart';

import '../components/auth/auth_page_shell.dart';

class RegisterPage extends AuthPageShell {
  RegisterPage(super.props);

  @override
  String get mode => 'Register';

  @override
  String get primaryAction => 'Create workspace';

  @override
  String get switchLabel => 'Sign in';

  @override
  String get switchHref => '/login';

  @override
  List<View> fields() {
    return [
      field('Full name', 'name', 'text', 'Ada Flint'),
      field('Work email', 'email', 'email', 'you@company.com'),
      field('Password', 'password', 'password', 'Create password'),
    ];
  }
}
