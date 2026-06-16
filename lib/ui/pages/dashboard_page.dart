import 'package:flint_dart/flint_ui.dart';

import '../components/dashboard/sample_dashboard_shell.dart';

class DashboardPage extends StatelessComponent {
  final Map<String, dynamic> props;

  DashboardPage(this.props);

  @override
  View build() {
    return SampleDashboardShell(
      name: props['name']?.toString() ?? 'there',
      metrics: _list('metrics'),
      activity: _list('activity'),
    );
  }

  List<Map<String, String>> _list(String key) {
    final raw = props[key];
    if (raw is List) {
      return raw.whereType<Map>().map((item) {
        return {
          for (final entry in item.entries)
            entry.key.toString(): entry.value?.toString() ?? '',
        };
      }).toList();
    }
    return const [];
  }
}
