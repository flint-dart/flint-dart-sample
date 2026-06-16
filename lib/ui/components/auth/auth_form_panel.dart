import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import 'auth_page_shell.dart';
import 'auth_status_message.dart';

class AuthFormPanel extends StatelessComponent {
  final AuthPageShell shell;

  AuthFormPanel({required this.shell});

  @override
  View build() {
    return PageSection(
      dartStyle: const DartStyle(
        padding: EdgeInsets.all('34px'),
        radius: '28px',
        background: 'rgba(255,255,255,.86)',
        border: Border.all(color: 'rgba(15,23,42,.08)'),
        shadow: '0 28px 90px rgba(16,24,40,.16)',
        backdropFilter: 'blur(18px)',
      ),
      children: [
        Row(
          dartStyle: const DartStyle(
            justifyContent: JustifyContent.between,
            alignItems: AlignItems.center,
            margin: EdgeInsets.only(bottom: '28px'),
          ),
          children: [
            Text.span(
              shell.mode,
              dartStyle: const DartStyle(fontSize: '24px', fontWeight: 900),
            ),
            TextLink(
              label: shell.switchLabel,
              href: shell.switchHref,
              dartStyle: shell.ghostLinkStyle,
            ),
          ],
        ),
        if (shell.statusMessage.isNotEmpty)
          AuthStatusMessage(
            message: shell.statusMessage,
            success: shell.statusSuccess,
          ),
        Form(
          onSubmit: shell.submit,
          dartStyle: const DartStyle(display: Display.grid, gap: '16px'),
          children: [
            ...shell.fields(),
            Button(
              child: shell.primaryAction,
              loading: shell.form.processing,
              props: const {'type': 'submit'},
              dartStyle: shell.primaryButtonStyle,
            ),
          ],
        ),
        Text.p(
          'This screen uses Flint UI components with DartStyle only.',
          dartStyle: const DartStyle(
            margin: EdgeInsets.only(top: '20px'),
            color: '#667085',
            fontSize: '14px',
            lineHeight: 1.7,
          ),
        ),
      ],
    );
  }
}
