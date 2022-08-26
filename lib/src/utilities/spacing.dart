part of flutter_bootstrap5;

EdgeInsets? margin(BuildContext context, String classNames) {
  final screenData = BootstrapTheme.of(context);
  final classList = classNames.trim().split(" ");

  var margin = _FB5Margin();
  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g m, mt, mb, etc.
    switch (prefix.substring(0, 1)) {
      case 'm':
        final newMargin = margin._copyWithClass(className) as _FB5Margin;
        margin = newMargin;
        break;
    }
  }

  return screenData.breakPoints._currentMargin(
    screenData.fontSize,
    screenData.currentBreakPoint,
    fromStyle: margin.defaultMargin,
    xs: margin.xs,
    sm: margin.sm,
    md: margin.md,
    lg: margin.lg,
    xl: margin.xl,
    xxl: margin.xxl,
  );
}

EdgeInsets? padding(BuildContext context, String classNames) {
  final screenData = BootstrapTheme.of(context);
  final classList = classNames.trim().split(" ");

  var padding = _FB5Padding();
  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g p, pt, pb, etc.
    switch (prefix.substring(0, 1)) {
      case 'p':
        final newPadding = padding._copyWithClass(className) as _FB5Padding;
        padding = newPadding;
        break;
    }
  }

  return screenData.breakPoints._currentPadding(
    screenData.fontSize,
    screenData.currentBreakPoint,
    fromStyle: padding.defaultPadding,
    xs: padding.xs,
    sm: padding.sm,
    md: padding.md,
    lg: padding.lg,
    xl: padding.xl,
    xxl: padding.xxl,
  );
}
