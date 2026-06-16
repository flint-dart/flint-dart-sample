import 'package:flint_dart/flint_ui.dart';

class TextLink extends StatelessComponent {
  final String label;
  final String href;
  final DartStyle dartStyle;

  TextLink({
    required this.label,
    required this.href,
    required this.dartStyle,
  });

  @override
  View build() {
    return Link(href: href, child: label, dartStyle: dartStyle);
  }
}
