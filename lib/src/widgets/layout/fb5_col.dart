part of flutter_bootstrap5;

class _ColStyle {
  final FB5Margin? margin;
  final FB5Padding? padding;
  final FB5Size? size;
  final FB5Offset? offset;
  final FB5Order? order;

  _ColStyle({
    this.margin,
    this.padding,
    this.size,
    this.offset,
    this.order,
  });

  _ColStyle copyWith({
    FB5Margin? margin,
    FB5Padding? padding,
    FB5Size? size,
    FB5Offset? offset,
    FB5Order? order,
  }) =>
      _ColStyle(
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        size: size ?? this.size,
        offset: offset ?? this.offset,
        order: order ?? this.order,
      );
}

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
    final style = _convertClassNamesToColStyle(classNames);
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
  final _ColStyle? style;
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
    final size = style?.size;
    final offset = style?.offset;
    final padding = style?.padding;
    final margin = style?.margin;

    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final screenData = BootstrapTheme.of(context);
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
        width: width ?? defaultWidth,
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

_ColStyle? _convertClassNamesToColStyle(String? classNames) {
  if (classNames == null) return null;

  final classList = classNames.trim().split(" ");
  var style = _ColStyle();

  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    switch (prefix.substring(0, 1)) {
      case 'm':
        var margin = style.margin ?? FB5Margin();
        final newMargin = margin._copyWithClass(className) as FB5Margin;
        style = style.copyWith(margin: newMargin);
        break;
      case 'p':
        var padding = style.padding ?? FB5Padding();
        final newPadding = padding._copyWithClass(className) as FB5Padding;
        style = style.copyWith(padding: newPadding);
        break;
      case 'c':
        var size = style.size ?? FB5Size();
        final newSize = size._copyWithClass(className);
        style = style.copyWith(size: newSize);
        break;
      case 'o':
        // o can be order or offset
        if (prefix == 'offset') {
          var offset = style.offset ?? FB5Offset();
          final newOffset = offset._copyWithClass(className);
          style = style.copyWith(offset: newOffset);
          break;
        }

        if (prefix == 'order') {
          var order = style.order ?? FB5Order();
          final newOrder = order._copyWithClass(className);
          style = style.copyWith(order: newOrder);
          break;
        }

        break;
    }
  }

  return style;
}
