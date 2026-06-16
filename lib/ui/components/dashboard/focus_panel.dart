import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'dashboard_styles.dart';
import 'panel_title.dart';

class FocusPanel extends StatelessComponent {
  @override
  View build() {
    return PageArticle(
      dartStyle: dashboardCardStyle.merge(
        const DartStyle(background: '#101828', color: Colors.white),
      ),
      children: [
        PanelTitle(title: 'Today focus', light: true),
        Text.p(
          'Review user growth, close billing checks, and ship the Flint UI sample as the default app surface.',
          dartStyle: const DartStyle(
            margin: EdgeInsets.only(top: '18px'),
            color: 'rgba(255,255,255,.7)',
            lineHeight: 1.8,
          ),
        ),
      ],
    );
  }
}
