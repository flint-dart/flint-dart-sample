import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'test_tile.dart';
import 'welcome_styles.dart';

class FlintUiTestPanel extends StatefulComponent {
  int checks = 3;

  @override
  View build() {
    return PageArticle(
      dartStyle: const DartStyle(
        padding: EdgeInsets.all('28px'),
        radius: '30px',
        background: 'rgba(255,255,255,.84)',
        border: Border.all(color: 'rgba(15,23,42,.08)'),
        shadow: '0 30px 90px rgba(16,24,40,.14)',
        backdropFilter: 'blur(18px)',
      ),
      children: [
        Text.h2(
          'Flint UI component test',
          dartStyle: const DartStyle(
            margin: EdgeInsets.all(0),
            fontSize: '28px',
          ),
        ),
        Text.p(
          'This live stateful component proves hydration, events, state updates, and rendering through Flint UI.',
          dartStyle: const DartStyle(
            margin: EdgeInsets.only(top: '10px'),
            color: '#667085',
            lineHeight: 1.7,
          ),
        ),
        Row(
          dartStyle: const DartStyle(
            display: Display.grid,
            gridTemplateColumns: 'repeat(3, minmax(0, 1fr))',
            gap: '12px',
            margin: EdgeInsets.only(top: '22px'),
          ),
          children: [
            TestTile(label: 'Routes', value: '4'),
            TestTile(label: 'Pages', value: '4'),
            TestTile(label: 'Checks', value: '$checks'),
          ],
        ),
        Button(
          child: 'Run UI check',
          dartStyle: welcomePrimaryButton.merge(
            const DartStyle(
              width: '100%',
              margin: EdgeInsets.only(top: '18px'),
            ),
          ),
          onPressed: (_) => setState(() {
            checks += 1;
          }),
        ),
      ],
    );
  }
}
