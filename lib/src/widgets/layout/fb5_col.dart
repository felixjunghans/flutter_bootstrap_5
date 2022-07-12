part of flutter_bootstrap5;

class FB5Col extends StatelessWidget {
  const FB5Col._({
    super.key,
    this.height,
    this.style,
    this.decoration,
    this.foregroundDecoration,
    this.transform,
    this.transformAlignment,
    this.clipBehavior = Clip.none,
    this.defaultWidth,
    this.child,
  });

  factory FB5Col({
    Key? key,
    String? classNames,
    double? height,
    Decoration? decoration,
    Decoration? foregroundDecoration,
    Matrix4? transform,
    AlignmentGeometry? transformAlignment,
    Clip clipBehavior = Clip.none,
    Widget? child,
  }) {
    final style = _convertClassNamesToWrapperStyle(classNames);
    return FB5Col._(
      key: key,
      height: height,
      style: style,
      decoration: decoration,
      foregroundDecoration: foregroundDecoration,
      transform: transform,
      transformAlignment: transformAlignment,
      clipBehavior: clipBehavior,
      child: child,
    );
  }

  // ignore: library_private_types_in_public_api
  final _WrapperStyle? style;
  final Decoration? decoration;
  final Decoration? foregroundDecoration;
  final Matrix4? transform;
  final AlignmentGeometry? transformAlignment;
  final double? height;
  final Clip clipBehavior;
  final double? defaultWidth;
  final Widget? child;

  FB5Col _wrapChild(Widget? Function(Widget? child) wrap,
          {double? defaultWidth}) =>
      FB5Col._(
        key: key,
        style: style,
        height: height,
        defaultWidth: defaultWidth,
        child: wrap(child),
      );

  int _order(BoxConstraints constraints, ScreenData screenData,
      BreakPoint currentBreakPoint) {
    final order = style?.order;

    return screenData.breakPoints._currentOrder(
      constraints.maxWidth,
      currentBreakPoint,
      fromStyle: order?.defaultOrder,
      xs: order?.xs,
      sm: order?.sm,
      md: order?.md,
      lg: order?.lg,
      xl: order?.xl,
      xxl: order?.xxl,
    );
  }

  @override
  Widget build(BuildContext context) {
    final display = style?.display;
    final size = style?.size;
    final offset = style?.offset;
    final padding = style?.padding;
    final margin = style?.margin;

    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final screenData = BootstrapTheme.of(context);

      final isVisible = screenData.breakPoints.currentDisplay(
        screenData.currentBreakPoint,
        fromStyle: display?.defaultDisplay,
        xs: display?.xs,
        sm: display?.sm,
        md: display?.md,
        lg: display?.lg,
        xl: display?.xl,
        xxl: display?.xxl,
      );

      if(!isVisible) return const SizedBox.shrink();

      final width = screenData.breakPoints.currentWidth(
        constraints.maxWidth,
        screenData.currentBreakPoint,
        fromStyle: size?.defaultSize,
        xs: size?.xs,
        sm: size?.sm,
        md: size?.md,
        lg: size?.lg,
        xl: size?.xl,
        xxl: size?.xxl,
        defaultWidth: defaultWidth,
      );

      final cm = screenData.breakPoints.currentMargin(
        screenData.fontSize,
        screenData.currentBreakPoint,
        fromStyle: margin?.defaultMargin,
        xs: margin?.xs,
        sm: margin?.sm,
        md: margin?.md,
        lg: margin?.lg,
        xl: margin?.xl,
        xxl: margin?.xxl,
      );

      final co = screenData.breakPoints.currentOffset(
        constraints.maxWidth,
        screenData.currentBreakPoint,
        fromStyle: offset?.defaultOffset,
        xs: offset?.xs,
        sm: offset?.sm,
        md: offset?.md,
        lg: offset?.lg,
        xl: offset?.xl,
        xxl: offset?.xxl,
      );

      final cp = screenData.breakPoints.currentPadding(
        screenData.fontSize,
        screenData.currentBreakPoint,
        fromStyle: padding?.defaultPadding,
        xs: padding?.xs,
        sm: padding?.sm,
        md: padding?.md,
        lg: padding?.lg,
        xl: padding?.xl,
        xxl: padding?.xxl,
      );

      return Container(
        margin: cm,
        padding: cp,
        width: width?.floorToDouble() ?? defaultWidth,
        height: height,
        decoration: decoration,
        foregroundDecoration: foregroundDecoration,
        transform: transform,
        transformAlignment: transformAlignment,
        clipBehavior: clipBehavior,
        child: child,
      );
    });
  }
}
