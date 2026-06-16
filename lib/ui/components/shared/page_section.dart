import 'package:flint_dart/flint_ui.dart';

class PageSection extends StatelessComponent {
  final DartStyle dartStyle;
  final List<View> children;

  PageSection({required this.dartStyle, this.children = const []});

  @override
  View build() {
    return Section(dartStyle: dartStyle, children: children);
  }
}
