import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'dashboard_nav_item.dart';
import 'logo_mark.dart';

class DashboardSidebar extends StatelessComponent {
  @override
  View build() {
    return PageAside(
      dartStyle: const DartStyle(
        minHeight: '100vh',
        padding: EdgeInsets.all('22px'),
        display: Display.flex,
        flexDirection: FlexDirection.column,
        gap: '24px',
        background: '#101828',
        color: Colors.white,
      ),
      children: [
        Row(
          dartStyle:
              const DartStyle(gap: '12px', alignItems: AlignItems.center),
          children: [
            LogoMark(),
            Text.span(
              'Flint HQ',
              dartStyle: const DartStyle(fontSize: '18px', fontWeight: 900),
            ),
          ],
        ),
        PageNav(
          dartStyle: const DartStyle(display: Display.grid, gap: '8px'),
          children: [
            DashboardNavItem(label: 'Overview', active: true),
            DashboardNavItem(label: 'Customers'),
            DashboardNavItem(label: 'Billing'),
            DashboardNavItem(label: 'Reports'),
          ],
        ),
        Container(dartStyle: const DartStyle(flex: 1)),
        TextLink(
          label: 'Login screen',
          href: '/login',
          dartStyle: const DartStyle(
            display: Display.inlineFlex,
            justifyContent: JustifyContent.center,
            alignItems: AlignItems.center,
            height: '44px',
            radius: '14px',
            background: 'rgba(255,255,255,.1)',
            color: Colors.white,
            fontWeight: 800,
          ),
        ),
      ],
    );
  }
}
