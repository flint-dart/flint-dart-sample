import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';

class DashboardNavItem extends StatelessComponent {
  final String label;
  final bool active;

  DashboardNavItem({required this.label, this.active = false});

  @override
  View build() {
    return TextLink(
      label: label,
      href: '#',
      dartStyle: DartStyle(
        display: Display.flex,
        alignItems: AlignItems.center,
        minHeight: '44px',
        padding: const EdgeInsets.symmetric(horizontal: '14px'),
        radius: '14px',
        background: active ? 'rgba(255,255,255,.14)' : 'transparent',
        color: active ? Colors.white : 'rgba(255,255,255,.68)',
        fontWeight: active ? 900 : 700,
      ),
    );
  }
}
