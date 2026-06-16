import 'package:flint_dart/flint_ui.dart';
import 'package:sample/ui/components/welcome/welcome_shell.dart';

class WelcomePage extends StatelessComponent {
  final Map<String, dynamic> props;

  WelcomePage(this.props);

  @override
  View build() {
    return WelcomeShell(
      version: props['version']?.toString() ?? 'dev',
      tagline: props['tagline']?.toString() ??
          'FlintDart brings routing, controllers, APIs, and browser UI into one Dart-first workflow.',
    );
  }
}
