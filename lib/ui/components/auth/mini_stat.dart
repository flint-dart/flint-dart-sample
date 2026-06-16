import 'package:flint_dart/flint_ui.dart';

class MiniStat extends StatelessComponent {
  final String value;
  final String label;

  MiniStat({required this.value, required this.label});

  @override
  View build() {
    return Container(
      dartStyle: const DartStyle(
        padding: EdgeInsets.all('16px'),
        radius: '18px',
        background: 'rgba(255,255,255,.1)',
        border: Border.all(color: 'rgba(255,255,255,.16)'),
      ),
      children: [
        Text.strong(value, dartStyle: const DartStyle(fontSize: '24px')),
        Text.p(
          label,
          dartStyle: const DartStyle(
            margin: EdgeInsets.only(top: '4px'),
            color: 'rgba(255,255,255,.65)',
          ),
        ),
      ],
    );
  }
}
