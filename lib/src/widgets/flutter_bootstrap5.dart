part of flutter_bootstrap5;

class FlutterBootstrap5 extends StatelessWidget {
  const FlutterBootstrap5({
    Key? key,
    this.breakPoints = const BreakPoints(),
    this.typography = const Typography(),
    this.containerBreakPoints = const ContainerBreakPoints(),
    this.colors = const FB5Colors(),
    this.fontSize = ScreenData.defaultFontSize,
    required this.builder,
  }) : super(key: key);

  final BreakPoints breakPoints;
  final Typography typography;
  final ContainerBreakPoints containerBreakPoints;
  final FB5Colors colors;
  final double fontSize;
  final Widget Function(BuildContext context) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final pixelRatio = window.devicePixelRatio;
      final physicalScreenSize = window.physicalSize;
      final logicalScreenSize = physicalScreenSize / pixelRatio;
      final breakPoint =
          breakPoints.getBreakPointForWidth(logicalScreenSize.width);
      return BootstrapTheme(
        data: ScreenData(
          breakPoints: breakPoints,
          containerBreakPoints: containerBreakPoints,
          currentBreakPoint: breakPoint,
          screenSize: logicalScreenSize,
          fontSize: fontSize,
          typography: typography,
          colors: colors,
        ),
        builder: (ctx) => builder(ctx),
      );
    });
  }
}
