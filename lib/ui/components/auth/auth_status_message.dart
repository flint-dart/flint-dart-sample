import 'package:flint_dart/flint_ui.dart';

class AuthStatusMessage extends StatelessComponent {
  final String message;
  final bool success;

  AuthStatusMessage({required this.message, required this.success});

  @override
  View build() {
    return Container(
      dartStyle: DartStyle(
        margin: const EdgeInsets.only(bottom: '16px'),
        padding: const EdgeInsets.all('14px'),
        radius: '16px',
        background: success ? 'rgba(15,118,110,.1)' : 'rgba(190,18,60,.08)',
        border: Border.all(
          color: success ? 'rgba(15,118,110,.24)' : 'rgba(190,18,60,.18)',
        ),
        color: success ? '#0f766e' : '#be123c',
        fontSize: '14px',
        fontWeight: 800,
      ),
      child: message,
    );
  }
}
