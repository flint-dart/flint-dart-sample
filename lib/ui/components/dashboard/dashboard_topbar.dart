import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';

class DashboardTopbar extends StatelessComponent {
  final String name;
  final bool loading;
  final Future<void> Function() refresh;

  DashboardTopbar({
    required this.name,
    required this.loading,
    required this.refresh,
  });

  @override
  View build() {
    return HeaderBlock(
      dartStyle: const DartStyle(
        display: Display.flex,
        justifyContent: JustifyContent.between,
        alignItems: AlignItems.center,
        gap: '16px',
      ),
      children: [
        Column(
          children: [
            Text.p(
              'Good morning, $name',
              dartStyle: const DartStyle(
                margin: EdgeInsets.all(0),
                color: '#667085',
                fontWeight: 800,
              ),
            ),
            Text.h1(
              'Business overview',
              dartStyle: const DartStyle(
                margin: EdgeInsets.only(top: '6px'),
                fontSize: '42px',
                lineHeight: 1,
              ),
            ),
          ],
        ),
        Button(
          child: loading ? 'Refreshing' : 'Refresh API',
          loading: loading,
          onPressed: (_) => refresh(),
          dartStyle: const DartStyle(
            display: Display.inlineFlex,
            alignItems: AlignItems.center,
            justifyContent: JustifyContent.center,
            minHeight: '46px',
            padding: EdgeInsets.symmetric(horizontal: '18px'),
            radius: '14px',
            background: '#101828',
            color: Colors.white,
            fontWeight: 900,
          ),
        ),
      ],
    );
  }
}
