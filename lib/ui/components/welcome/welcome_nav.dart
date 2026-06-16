import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'welcome_styles.dart';

class WelcomeNav extends StatelessComponent {
  @override
  View build() {
    return HeaderBlock(
      dartStyle: const DartStyle(
        maxWidth: '1180px',
        margin: EdgeInsets.symmetric(horizontal: 'auto'),
        display: Display.flex,
        alignItems: AlignItems.center,
        justifyContent: JustifyContent.between,
        gap: '16px',
      ),
      children: [
        Row(
          dartStyle:
              const DartStyle(gap: '12px', alignItems: AlignItems.center),
          children: [
            Container(
              dartStyle: const DartStyle(
                width: '42px',
                height: '42px',
                display: Display.grid,
                alignItems: AlignItems.center,
                justifyItems: 'center',
                radius: '14px',
                background: '#0f766e',
                color: Colors.white,
                fontWeight: 900,
              ),
              child: Text('F'),
            ),
            Text.strong(
              'Flint Dart',
              dartStyle: const DartStyle(fontSize: '18px'),
            ),
          ],
        ),
        Row(
          dartStyle:
              const DartStyle(gap: '10px', alignItems: AlignItems.center),
          children: [
            TextLink(
              label: 'Dashboard',
              href: '/dashboard',
              dartStyle: welcomeNavLink,
            ),
            TextLink(label: 'Login', href: '/login', dartStyle: welcomeNavLink),
            TextLink(
              label: 'Register',
              href: '/register',
              dartStyle: welcomeNavLink.merge(
                const DartStyle(background: '#101828', color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
