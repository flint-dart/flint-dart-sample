import 'package:flint_dart/flint_ui.dart';

class LogoMark extends StatelessComponent {
  @override
  View build() {
    return Container(
      dartStyle: const DartStyle(
        width: '42px',
        height: '42px',
        display: Display.grid,
        alignItems: AlignItems.center,
        justifyItems: 'center',
        radius: '14px',
        background: '#0f766e',
        fontWeight: 900,
      ),
      child: Text('F'),
    );
  }
}
