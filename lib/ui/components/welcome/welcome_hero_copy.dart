import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'welcome_styles.dart';

class WelcomeHeroCopy extends StatelessComponent {
  final String version;
  final String tagline;

  WelcomeHeroCopy({required this.version, required this.tagline});

  @override
  View build() {
    return Column(
      dartStyle: const DartStyle(gap: '22px'),
      children: [
        Text.span(
          'Flint UI test surface - v$version',
          dartStyle: const DartStyle(
            display: Display.inlineFlex,
            alignItems: AlignItems.center,
            padding: EdgeInsets.symmetric(vertical: '8px', horizontal: '12px'),
            radius: '999px',
            background: 'rgba(15,118,110,.1)',
            color: '#0f766e',
            fontSize: '13px',
            fontWeight: 900,
          ),
        ),
        Text.h1(
          'Build backend and browser UI in Dart',
          dartStyle: const DartStyle(
            margin: EdgeInsets.all(0),
            maxWidth: '760px',
            fontSize: 'clamp(52px, 8vw, 86px)',
            lineHeight: .9,
          ),
        ),
        Text.p(
          tagline,
          dartStyle: const DartStyle(
            margin: EdgeInsets.all(0),
            maxWidth: '620px',
            color: '#475467',
            fontSize: '18px',
            lineHeight: 1.8,
          ),
        ),
        Row(
          dartStyle: const DartStyle(gap: '12px', flexWrap: FlexWrap.wrap),
          children: [
            TextLink(
              label: 'Open dashboard',
              href: '/dashboard',
              dartStyle: welcomePrimaryLink,
            ),
            TextLink(
              label: 'Try login',
              href: '/login',
              dartStyle: welcomeSecondaryLink,
            ),
          ],
        ),
      ],
    );
  }
}
