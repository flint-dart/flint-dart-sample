import 'package:flint_dart/flint_ui.dart';

class HeaderBlock extends StatelessComponent {
  final DartStyle dartStyle;
  final List<View> children;

  HeaderBlock({required this.dartStyle, this.children = const []});

  @override
  View build() {
    return Container(
      props: const {'role': 'banner'},
      dartStyle: dartStyle,
      children: children,
    );
  }
}
