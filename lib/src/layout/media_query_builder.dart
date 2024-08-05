part of flutter_bootstrap5;
typedef MediaQueryBuilderFunction = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
  ScreenData data,
);
class MediaQueryBuilder extends StatelessWidget {
  const MediaQueryBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);
  final MediaQueryBuilderFunction builder;
  //INIT WIDTH
  static double width = 576;
  @override
  Widget build(BuildContext context) {
    //GET WIDTH
    width = MediaQuery.of(context).size.width;
    return LayoutBuilder(builder: (context, constraints) {
      final screenData = BootstrapTheme.of(context);
      return builder(
        context,
        constraints,
        screenData,
      );
    });
  }
  //ADDED FUNCS
  static BootStrapGetBreakPoint() {
    print("width=>$width");
    if (width >= 0 && width <= 576) {
      return _BootstrapBreakPoints.xs;
    } else if (width >= 576 && width <= 768) {
      return _BootstrapBreakPoints.sm;
    } else if (width >= 768 && width <= 992) {
      return _BootstrapBreakPoints.md;
    } else if (width >= 992 && width <= 1200) {
      return _BootstrapBreakPoints.lg;
    } else if (width >= 1200 && width <= 1400) {
      return _BootstrapBreakPoints.xl;
    } else if (width >= 1400 && width <= double.infinity) {
      return _BootstrapBreakPoints.xxl;
    }
  }
  static BootStrapGetSize() {
    if (width >= 0 && width <= 576) {
      return _BootstrapBreakPoints.xs.maxWidth;
    } else if (width >= 576 && width <= 768) {
      return _BootstrapBreakPoints.sm.maxWidth;
    } else if (width >= 768 && width <= 992) {
      return _BootstrapBreakPoints.md.maxWidth;
    } else if (width >= 992 && width <= 1200) {
      return _BootstrapBreakPoints.lg.maxWidth;
    } else if (width >= 1200 && width <= 1400) {
      return _BootstrapBreakPoints.xl.maxWidth;
    } else if (width >= 1400 && width <= double.infinity) {
      return _BootstrapBreakPoints.xxl.maxWidth;
    }
  }
}
