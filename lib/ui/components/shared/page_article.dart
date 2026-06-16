import 'package:flint_dart/flint_ui.dart';

class PageArticle extends StatelessComponent {
  final DartStyle dartStyle;
  final List<View> children;

  PageArticle({required this.dartStyle, this.children = const []});

  @override
  View build() {
    return Container(
      props: const {'role': 'article'},
      dartStyle: dartStyle,
      children: children,
    );
  }
}
