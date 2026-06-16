import 'package:flint_dart/flint_ui.dart';

const welcomeNavLink = DartStyle(
  display: Display.inlineFlex,
  alignItems: AlignItems.center,
  justifyContent: JustifyContent.center,
  minHeight: '40px',
  padding: EdgeInsets.symmetric(horizontal: '14px'),
  radius: '999px',
  background: 'rgba(255,255,255,.72)',
  color: '#344054',
  fontSize: '13px',
  fontWeight: 900,
);

const welcomePrimaryLink = DartStyle(
  display: Display.inlineFlex,
  alignItems: AlignItems.center,
  justifyContent: JustifyContent.center,
  minHeight: '52px',
  padding: EdgeInsets.symmetric(horizontal: '18px'),
  radius: '16px',
  background: '#101828',
  color: Colors.white,
  fontWeight: 900,
);

const welcomeSecondaryLink = DartStyle(
  display: Display.inlineFlex,
  alignItems: AlignItems.center,
  justifyContent: JustifyContent.center,
  minHeight: '52px',
  padding: EdgeInsets.symmetric(horizontal: '18px'),
  radius: '16px',
  background: Colors.white,
  border: Border.all(color: '#d0d5dd'),
  color: '#344054',
  fontWeight: 900,
);

const welcomePrimaryButton = DartStyle(
  minHeight: '52px',
  radius: '16px',
  background: '#0f766e',
  border: Border.all(color: '#0f766e'),
  color: Colors.white,
  fontWeight: 900,
  cursor: Cursor.pointer,
);
