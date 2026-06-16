import 'package:flint_dart/flint_ui.dart';

class BrandPill extends StatelessComponent {
  @override
  View build() {
    return Row(
      dartStyle: const DartStyle(
        display: Display.inlineFlex,
        alignItems: AlignItems.center,
        gap: '10px',
        padding: EdgeInsets.symmetric(vertical: '8px', horizontal: '12px'),
        radius: '999px',
        background: 'rgba(255,255,255,.12)',
      ),
      children: [
        Text.span('F', dartStyle: const DartStyle(fontWeight: 900)),
        Text.span('Flint UI', dartStyle: const DartStyle(fontWeight: 800)),
      ],
    );
  }
}
