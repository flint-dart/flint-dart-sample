import 'package:flint_dart/flint_ui.dart';

import 'pages/dashboard_page.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/welcome_page.dart';

final componentRegistry = PageRegistry({
  'Welcome': (props) => WelcomePage(props),
  'Dashboard': (props) => DashboardPage(props),
  'Login': (props) => LoginPage(props),
  'Register': (props) => RegisterPage(props),
});
