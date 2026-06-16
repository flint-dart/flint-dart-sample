import 'package:flint_dart/flint_ui.dart';

class ActivityRow extends StatelessComponent {
  final String title;
  final String time;
  final String color;

  ActivityRow({required this.title, required this.time, required this.color});

  @override
  View build() {
    return Row(
      dartStyle: const DartStyle(
        justifyContent: JustifyContent.between,
        gap: '12px',
        padding: EdgeInsets.all('14px'),
        radius: '16px',
        background: '#f9fafb',
      ),
      children: [
        Text.span(title, dartStyle: DartStyle(color: color, fontWeight: 900)),
        Text.span(
          time,
          dartStyle: const DartStyle(color: '#667085', fontWeight: 700),
        ),
      ],
    );
  }
}
