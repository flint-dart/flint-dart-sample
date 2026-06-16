import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'activity_row.dart';
import 'dashboard_styles.dart';
import 'panel_title.dart';

class ActivityPanel extends StatelessComponent {
  final List<Map<String, String>> rows;

  ActivityPanel({required this.rows});

  @override
  View build() {
    return PageArticle(
      dartStyle: dashboardCardStyle.merge(const DartStyle(minHeight: '360px')),
      children: [
        PanelTitle(title: 'Pipeline'),
        Column(
          dartStyle: const DartStyle(
            display: Display.grid,
            gap: '12px',
            margin: EdgeInsets.only(top: '18px'),
          ),
          children: [
            for (final row in rows)
              ActivityRow(
                title: row['title'] ?? '',
                time: row['time'] ?? '',
                color: row['color'] ?? '#0f766e',
              ),
          ],
        ),
      ],
    );
  }
}
