import 'package:flint_dart/flint_ui.dart';

class PageAside extends StatelessComponent {
  final DartStyle dartStyle;
  final List<View> children;

  PageAside({required this.dartStyle, this.children = const []});

  @override
  View build() {
    return Container(
      props: const {'role': 'complementary'},
      dartStyle: dartStyle,
      children: children,
    );
  }
}
