import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'activity_panel.dart';
import 'dashboard_topbar.dart';
import 'focus_panel.dart';
import 'metric_card.dart';

class DashboardContent extends StatelessComponent {
  final String name;
  final List<Map<String, String>> metrics;
  final List<Map<String, String>> activity;
  final bool loading;
  final Future<void> Function() refresh;

  DashboardContent({
    required this.name,
    required this.metrics,
    required this.activity,
    required this.loading,
    required this.refresh,
  });

  @override
  View build() {
    return PageSection(
      dartStyle: const DartStyle(
        padding: EdgeInsets.all('28px'),
        display: Display.grid,
        gap: '24px',
      ),
      children: [
        DashboardTopbar(name: name, loading: loading, refresh: refresh),
        Row(
          dartStyle: const DartStyle(
            display: Display.grid,
            gridTemplateColumns: 'repeat(auto-fit, minmax(210px, 1fr))',
            gap: '16px',
          ),
          children: [
            for (final metric in metrics) MetricCard(metric: metric),
          ],
        ),
        Row(
          dartStyle: const DartStyle(
            display: Display.grid,
            gridTemplateColumns: 'minmax(0, 1.25fr) minmax(280px, .75fr)',
            gap: '18px',
            alignItems: AlignItems.start,
          ),
          children: [
            ActivityPanel(rows: activity),
            FocusPanel(),
          ],
        ),
      ],
    );
  }
}
