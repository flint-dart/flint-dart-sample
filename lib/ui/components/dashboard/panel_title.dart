import 'package:flint_dart/flint_ui.dart';

class PanelTitle extends StatelessComponent {
  final String title;
  final bool light;

  PanelTitle({required this.title, this.light = false});

  @override
  View build() {
    return Text.h2(
      title,
      dartStyle: DartStyle(
        margin: const EdgeInsets.all(0),
        fontSize: '22px',
        color: light ? Colors.white : '#101828',
      ),
    );
  }
}
