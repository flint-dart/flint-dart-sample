import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'brand_pill.dart';
import 'mini_stat.dart';

class AuthBrandPanel extends StatelessComponent {
  final String headline;
  final String subtitle;

  AuthBrandPanel({required this.headline, required this.subtitle});

  @override
  View build() {
    return PageAside(
      dartStyle: DartStyle(
        display: Display.flex,
        flexDirection: FlexDirection.column,
        justifyContent: JustifyContent.between,
        minHeight: '620px',
        padding: const EdgeInsets.all('36px'),
        radius: '28px',
        background: Gradient.linear(145, const [
          GradientStop(Color('#101828'), 0),
          GradientStop(Color('#173b36'), 54),
          GradientStop(Color('#0f766e'), 100),
        ]),
        color: Colors.white,
        overflow: Overflow.hidden,
        position: Position.relative,
      ),
      children: [
        Column(
          children: [
            BrandPill(),
            Text.h1(
              headline,
              dartStyle: const DartStyle(
                margin: EdgeInsets.only(top: '42px', bottom: '16px'),
                fontSize: 'clamp(44px, 7vw, 76px)',
                lineHeight: .92,
                maxWidth: '680px',
              ),
            ),
            Text.p(
              subtitle,
              dartStyle: const DartStyle(
                margin: EdgeInsets.all(0),
                maxWidth: '560px',
                color: 'rgba(255,255,255,.74)',
                fontSize: '18px',
                lineHeight: 1.8,
              ),
            ),
          ],
        ),
        Row(
          dartStyle: const DartStyle(
            display: Display.grid,
            gridTemplateColumns: 'repeat(3, minmax(0, 1fr))',
            gap: '12px',
          ),
          children: [
            MiniStat(value: '99.9%', label: 'uptime'),
            MiniStat(value: '4x', label: 'faster UI'),
            MiniStat(value: 'Dart', label: 'full stack'),
          ],
        ),
      ],
    );
  }
}
