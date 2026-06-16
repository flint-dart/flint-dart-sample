import 'package:flint_dart/flint_ui.dart';

import '../shared/shared.dart';
import '../../services/sample_api_client.dart';
import 'auth_brand_panel.dart';
import 'auth_form_panel.dart';

abstract class AuthPageShell extends StatefulComponent {
  final Map<String, dynamic> props;

  AuthPageShell(this.props);

  final FormController form = useForm({
    'name': '',
    'email': '',
    'password': '',
  });

  String statusMessage = '';
  bool statusSuccess = false;

  String get mode;
  String get primaryAction;
  String get switchLabel;
  String get switchHref;
  String get endpoint => props['endpoint']?.toString() ?? '/auth/login';
  List<View> fields();

  Future<void> submit(Object event) async {
    FlintEvent.preventDefault(event);
    setState(() {
      statusMessage = '';
      statusSuccess = false;
      form.processing = true;
      form.clearErrors();
    });

    try {
      final payload = await SampleApiClient.submitAuth(endpoint, form.data);
      final user = payload['user'];
      final token = payload['token']?.toString();
      final name = user is Map ? user['name']?.toString() : null;
      if (token != null && token.isNotEmpty) {
        try {
          authSession.save(
            token: token,
            user: user is Map
                ? user.map((key, value) => MapEntry(key.toString(), value))
                : const {},
          );
        } catch (_) {}
      }
      setState(() {
        form.processing = false;
        form.wasSuccessful = true;
        form.recentlySuccessful = true;
        statusSuccess = true;
        statusMessage = name == null
            ? '$mode request completed.'
            : '$mode request completed for $name.';
      });
      navigation.assign('/dashboard');
    } catch (error) {
      setState(() {
        form.processing = false;
        statusSuccess = false;
        statusMessage = _errorMessage(error);
        form.setErrors(error);
      });
    }
  }

  String _errorMessage(Object error) {
    if (error is Map) {
      final message = error['message']?.toString();
      if (message != null && message.isNotEmpty) return message;

      final errors = error['errors'];
      if (errors is Map) {
        for (final value in errors.values) {
          if (value is List && value.isNotEmpty) return value.first.toString();
          if (value != null) return value.toString();
        }
      }
    }
    return 'Could not complete the request.';
  }

  @override
  View build() {
    final headline = props['headline']?.toString() ?? 'Welcome';
    final subtitle = props['subtitle']?.toString() ?? '';

    return ShellMain(
      dartStyle: DartStyle(
        minHeight: '100vh',
        display: Display.grid,
        alignItems: AlignItems.center,
        padding: const EdgeInsets.all('24px'),
        background: Background.layers([
          Gradient.radialCircle(
            at: const GradientPosition.percent(15, 10),
            stops: const [
              Color('rgba(20,184,166,.18)'),
              GradientStop(Colors.transparent, '28rem'),
            ],
          ),
          Gradient.linear(135, const [
            Color('#f8fafc'),
            Color('#eef2ff'),
          ]),
        ]),
      ),
      children: [
        PageSection(
          dartStyle: const DartStyle(
            width: 'min(1120px, 100%)',
            margin: EdgeInsets.symmetric(horizontal: 'auto'),
            display: Display.grid,
            gridTemplateColumns: 'minmax(0, 1fr) minmax(360px, 460px)',
            gap: '28px',
            alignItems: AlignItems.stretch,
          ),
          children: [
            AuthBrandPanel(headline: headline, subtitle: subtitle),
            AuthFormPanel(shell: this),
          ],
        ),
      ],
    );
  }

  View field(String label, String name, String type, String placeholder) {
    return TextField(
      label: label,
      name: name,
      controller: form.controller(name),
      type: type,
      placeholder: placeholder,
      errors: form.errors,
      dartStyle: const DartStyle(display: Display.grid, gap: '8px'),
      inputDartStyle: inputStyle,
    );
  }

  DartStyle get inputStyle => const DartStyle(
        height: '52px',
        width: '100%',
        padding: EdgeInsets.symmetric(horizontal: '16px'),
        radius: '16px',
        border: Border.all(color: '#d0d5dd'),
        background: '#ffffff',
        color: '#101828',
        fontSize: '15px',
      );

  DartStyle get primaryButtonStyle => const DartStyle(
        height: '54px',
        border: Border.all(color: '#101828'),
        radius: '16px',
        background: '#101828',
        color: Colors.white,
        fontWeight: 900,
        cursor: Cursor.pointer,
      );

  DartStyle get ghostLinkStyle => const DartStyle(
        display: Display.inlineFlex,
        alignItems: AlignItems.center,
        minHeight: '38px',
        padding: EdgeInsets.symmetric(horizontal: '12px'),
        radius: '999px',
        background: '#f2f4f7',
        color: '#344054',
        fontSize: '13px',
        fontWeight: 800,
      );
}
