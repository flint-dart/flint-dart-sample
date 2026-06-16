import 'package:flint_dart/flint_ui.dart';

import 'component_registry.dart';
import 'styles/app_root_design.dart';

void main() {
  createFlintApp(
    '#app',
    registry: componentRegistry,
    rootDesign: appRootDesign,
  );
}
