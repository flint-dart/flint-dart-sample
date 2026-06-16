import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'dashboard_styles.dart';

class MetricCard extends StatelessComponent {
  final Map<String, String> metric;

  MetricCard({required this.metric});

  @override
  View build() {
    return PageArticle(
      dartStyle: dashboardCardStyle,
      children: [
        Text.p(
          metric['label'] ?? '',
          dartStyle: const DartStyle(
            margin: EdgeInsets.all(0),
            color: '#667085',
            fontWeight: 800,
          ),
        ),
        Text.strong(
          metric['value'] ?? '',
          dartStyle: const DartStyle(
            display: Display.block,
            margin: EdgeInsets.only(top: '14px'),
            fontSize: '34px',
            lineHeight: 1,
          ),
        ),
        Text.span(
          metric['delta'] ?? '',
          dartStyle: const DartStyle(
            display: Display.inlineBlock,
            margin: EdgeInsets.only(top: '14px'),
            color: '#0f766e',
            fontWeight: 900,
          ),
        ),
      ],
    );
  }
}
