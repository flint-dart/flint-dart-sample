import 'dart:io';

import 'package:flint_ui/flint_ui.dart' as flint;
import 'package:sample/ui/main.dart' as app;

void main() {
  flint.resetCollectedStyleCss();
  app.main();
  stdout.write(flint.consumeCollectedStyleCss());
}
