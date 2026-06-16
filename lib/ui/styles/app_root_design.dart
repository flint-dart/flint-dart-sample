import 'package:flint_dart/flint_ui.dart';

final appRootDesign = RootDesign(
  name: 'sample',
  theme: const FlintTheme(
    colors: {
      'pageBackground': Color('#f7f8fb'),
      'pageText': Color('#101828'),
      'mutedText': Color('#475467'),
      'brand': Color('#0f766e'),
      'surface': Color('#ffffff'),
    },
    radii: {
      'sm': SizeValue.rem(0.55),
      'md': SizeValue.rem(0.9),
      'lg': SizeValue.rem(1),
    },
    shadows: {
      'panel': '0 24px 80px rgba(16, 24, 40, 0.2)',
    },
    fonts: {
      'sans':
          'Inter, ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif',
      'mono':
          '"Cascadia Code", "SFMono-Regular", Consolas, "Liberation Mono", monospace',
    },
  ),
  root: DartStyle(
    fontFamily: ThemeToken.font('sans'),
    background: ThemeToken.color('pageBackground'),
    color: ThemeToken.color('pageText'),
  ),
  all: const DartStyle(boxSizing: BoxSizing.borderBox),
  body: DartStyle(
    margin: const EdgeInsets.all(0),
    minWidth: 320,
    background: Background.layers([
      Gradient.radialCircle(
        at: const GradientPosition.percent(20, 10),
        stops: const [
          Color('rgba(20, 184, 166, 0.16)'),
          GradientStop(Colors.transparent, '28rem'),
        ],
      ),
      Gradient.radialCircle(
        at: const GradientPosition.percent(80, 0),
        stops: const [
          Color('rgba(244, 114, 182, 0.13)'),
          GradientStop(Colors.transparent, '24rem'),
        ],
      ),
      const Color('#f7f8fb'),
    ]),
  ),
  links: const DartStyle(
    color: Color('inherit'),
    textDecoration: TextDecorationStyle.none,
  ),
  selectors: const {
    '[data-flint-page]': DartStyle(minHeight: '100vh'),
    'img, picture, video, canvas, svg': DartStyle(maxWidth: '100%'),
    'button, input, textarea, select': DartStyle(fontFamily: Color('inherit')),
  },
  keyframes: [
    StyleKeyframes.spin(),
    StyleKeyframes.fadeIn(),
  ],
);
