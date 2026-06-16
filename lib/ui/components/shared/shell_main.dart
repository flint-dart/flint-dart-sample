import 'package:flint_dart/flint_ui.dart';

class ShellMain extends StatelessComponent {
  final DartStyle dartStyle;
  final List<View> children;

  ShellMain({required this.dartStyle, this.children = const []});

  @override
  View build() {
    return Container(
      props: const {'role': 'main'},
      dartStyle: dartStyle,
      children: children,
    );
  }
}
