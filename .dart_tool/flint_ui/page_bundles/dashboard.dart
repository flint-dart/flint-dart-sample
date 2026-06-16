import 'package:flint_ui/flint_ui.dart';
import 'package:sample/ui/pages/dashboard_page.dart';
import 'package:sample/ui/styles/app_root_design.dart';

void main() {
  createFlintApp(
    '#app',
    pages: {'Dashboard': (props) => DashboardPage(props)},
    rootDesign: appRootDesign,
  );
}
