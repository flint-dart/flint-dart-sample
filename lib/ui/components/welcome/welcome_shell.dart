import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'flint_ui_test_panel.dart';
import 'welcome_hero_copy.dart';
import 'welcome_nav.dart';

class WelcomeShell extends StatelessComponent {
  final String version;
  final String tagline;

  WelcomeShell({required this.version, required this.tagline});

  @override
  View build() {
    return ShellMain(
      dartStyle: DartStyle(
        minHeight: '100vh',
        padding: const EdgeInsets.all('28px'),
        background: Background.layers([
          Gradient.radialCircle(
            at: const GradientPosition.percent(12, 8),
            stops: const [
              Color('rgba(15,118,110,.18)'),
              GradientStop(Colors.transparent, '30rem'),
            ],
          ),
          Gradient.radialCircle(
            at: const GradientPosition.percent(86, 12),
            stops: const [
              Color('rgba(37,99,235,.16)'),
              GradientStop(Colors.transparent, '26rem'),
            ],
          ),
          Gradient.linear(135, const [
            Color('#ffffff'),
            Color('#eef6ff'),
          ]),
        ]),
      ),
      children: [
        WelcomeNav(),
        PageSection(
          dartStyle: const DartStyle(
            minHeight: 'calc(100vh - 96px)',
            display: Display.grid,
            gridTemplateColumns: 'minmax(0, 1.05fr) minmax(360px, .95fr)',
            gap: '32px',
            alignItems: AlignItems.center,
            maxWidth: '1180px',
            margin: EdgeInsets.symmetric(horizontal: 'auto'),
          ),
          children: [
            WelcomeHeroCopy(version: version, tagline: tagline),
            FlintUiTestPanel(),
          ],
        ),
      ],
    );
  }
}
