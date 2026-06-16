import 'package:flint_dart/flint_ui.dart';

class PageNav extends StatelessComponent {
  final DartStyle dartStyle;
  final List<View> children;

  PageNav({required this.dartStyle, this.children = const []});

  @override
  View build() {
    return Container(
      props: const {'role': 'navigation'},
      dartStyle: dartStyle,
      children: children,
    );
  }
}
