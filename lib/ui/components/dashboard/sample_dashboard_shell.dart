import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import '../../services/sample_api_client.dart';
import 'dashboard_content.dart';
import 'dashboard_sidebar.dart';

class SampleDashboardShell extends StatefulComponent {
  final String name;
  final List<Map<String, String>> metrics;
  final List<Map<String, String>> activity;
  late final ResourceController<Map<String, dynamic>> dashboard;

  SampleDashboardShell({
    required this.name,
    required this.metrics,
    this.activity = const [],
  }) {
    dashboard = ResourceController<Map<String, dynamic>>(
      initialData: {
        'name': name,
        'metrics': metrics,
        'activity': activity,
      },
      loader: SampleApiClient.dashboard,
    );
  }

  @override
  void didMount() {
    dashboard.refresh(silent: true);
  }

  @override
  void willUnmount() {
    dashboard.dispose();
  }

  @override
  View build() {
    return ShellMain(
      dartStyle: const DartStyle(
        minHeight: '100vh',
        display: Display.grid,
        gridTemplateColumns: '280px minmax(0, 1fr)',
        background: '#f7f8fb',
        color: '#101828',
      ),
      children: [
        DashboardSidebar(),
        ResourceView<Map<String, dynamic>>(dashboard, (snapshot) {
          final data = snapshot.data ?? const {};
          return DashboardContent(
            name: data['name']?.toString() ?? name,
            metrics: _mapList(data['metrics'], metrics),
            activity: _mapList(data['activity'], activity),
            loading: snapshot.isLoading,
            refresh: () => dashboard.refresh(silent: true),
          );
        }),
      ],
    );
  }

  List<Map<String, String>> _mapList(
    Object? raw,
    List<Map<String, String>> fallback,
  ) {
    if (raw is List) {
      return raw.whereType<Map>().map((item) {
        return {
          for (final entry in item.entries)
            entry.key.toString(): entry.value?.toString() ?? '',
        };
      }).toList();
    }
    return fallback;
  }
}
