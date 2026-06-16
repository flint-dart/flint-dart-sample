import 'package:flint_ui/flint_ui.dart';
import 'package:sample/ui/pages/register_page.dart';
import 'package:sample/ui/styles/app_root_design.dart';

void main() {
  createFlintApp(
    '#app',
    pages: {'Register': (props) => RegisterPage(props)},
    rootDesign: appRootDesign,
  );
}
