import 'package:flint_ui/flint_ui.dart';
import 'package:sample/ui/pages/welcome_page.dart';
import 'package:sample/ui/styles/app_root_design.dart';

void main() {
  createFlintApp(
    '#app',
    pages: {'Welcome': (props) => WelcomePage(props)},
    rootDesign: appRootDesign,
  );
}
