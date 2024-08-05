part of flutter_bootstrap5;

class BootstrapTheme extends StatelessWidget {
  const BootstrapTheme({
    Key? key,
    required this.data,
    required this.builder,
  }) : super(key: key);

  final ScreenData data;
  final Widget Function(BuildContext context) builder;

  static ScreenData of(BuildContext context) {
    final _InheritedBootstrapTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedBootstrapTheme>();
    final ScreenData data =
        inheritedTheme?.bootstrapTheme.data ?? ScreenData.fallBack();
    return data;
  }


  @override
  Widget build(BuildContext context) {

    return _InheritedBootstrapTheme(
      bootstrapTheme: this,
      child: Builder(
        builder: (ctx) => builder(ctx),
      ),
    );
  }


}

class _InheritedBootstrapTheme extends InheritedWidget {
  const _InheritedBootstrapTheme({
    Key? key,
    required this.bootstrapTheme,
    required Widget child,
  }) : super(key: key, child: child);

  final BootstrapTheme bootstrapTheme;

  Widget wrap(BuildContext context, Widget child) {
    return BootstrapTheme(
        data: bootstrapTheme.data, builder: (_) => super.child);
  }

  @override
  bool updateShouldNotify(_InheritedBootstrapTheme old) =>
      bootstrapTheme.data != old.bootstrapTheme.data;
}

class ScreenData {
  final BreakPoints breakPoints;
  final ContainerBreakPoints containerBreakPoints;
  final BreakPoint currentBreakPoint;
  final Size screenSize;
  final FB5Typography _typography;
  final double fontSize;
  final FB5Colors colors;

  static const double defaultFontSize = 16.0;

  static ScreenData fallBack() => ScreenData(
        breakPoints: const BreakPoints(),
        currentBreakPoint: MediaQueryBuilder.BootStrapGetBreakPoint(),
        screenSize: Size.fromWidth(
          MediaQueryBuilder.BootStrapGetSize(),
        ),
        fontSize: defaultFontSize,
        containerBreakPoints: const ContainerBreakPoints(),
        typography: const FB5Typography(),
        colors: const FB5Colors(),
      );

  ThemeData toTheme({ThemeData? theme}) => (theme ?? ThemeData()).copyWith(
        textTheme: TextTheme(
          headlineLarge: textStyles.h1.merge(theme?.textTheme.headlineLarge),
          headlineMedium: textStyles.h3.merge(theme?.textTheme.headlineMedium),
          headlineSmall: textStyles.h5.merge(theme?.textTheme.headlineSmall),
          displayLarge:
              textStyles.display1.merge(theme?.textTheme.displayLarge),
          displayMedium:
              textStyles.display3.merge(theme?.textTheme.displayMedium),
          displaySmall:
              textStyles.display5.merge(theme?.textTheme.displaySmall),
          bodyLarge: textStyles.lead.merge(theme?.textTheme.bodyLarge),
          bodyMedium: textStyles.paragraph.merge(theme?.textTheme.bodyMedium),
          bodySmall: textStyles.small.merge(theme?.textTheme.bodySmall),
        ),
      );

  TextStyles get textStyles => TextStyles(
        fontSize: fontSize,
        screenSize: screenSize,
        breakPoint: currentBreakPoint,
        breakPoints: breakPoints,
        typography: _typography,
      );

  ScreenData({
    required this.breakPoints,
    required this.currentBreakPoint,
    required this.screenSize,
    required this.fontSize,
    required this.containerBreakPoints,
    required FB5Typography typography,
    required this.colors,
  }) : _typography = typography;
}
