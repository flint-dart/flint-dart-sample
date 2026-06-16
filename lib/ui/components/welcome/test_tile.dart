import 'package:flint_dart/flint_ui.dart';

class TestTile extends StatelessComponent {
  final String label;
  final String value;

  TestTile({required this.label, required this.value});

  @override
  View build() {
    return Container(
      dartStyle: const DartStyle(
        padding: EdgeInsets.all('16px'),
        radius: '18px',
        background: '#f9fafb',
        border: Border.all(color: '#eaecf0'),
      ),
      children: [
        Text.strong(
          value,
          dartStyle: const DartStyle(display: Display.block, fontSize: '28px'),
        ),
        Text.span(
          label,
          dartStyle: const DartStyle(color: '#667085', fontWeight: 800),
        ),
      ],
    );
  }
}
