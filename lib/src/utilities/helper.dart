part of flutter_bootstrap5;

T responsiveValue<T>(BuildContext context,
    {required T defaultValue, T? xs, T? sm, T? md, T? lg, T? xl, T? xxl}) {
  final screenData = BootstrapTheme.of(context);
  final breakPoint = screenData.currentBreakPoint;
  final breakPoints = screenData.breakPoints;

  var value = defaultValue;

  if (breakPoint.isBreakPointOrLarger(breakPoints.xs) && xs != null) {
    value = xs;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.sm) && sm != null) {
    value = sm;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.md) && md != null) {
    value = md;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.lg) && lg != null) {
    value = lg;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xl) && xl != null) {
    value = xl;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xxl) && xxl != null) {
    value = xxl;
  }

  return value;
}

T? responsiveValueOrNull<T>(
  BuildContext context, {
  required T? xs,
  required T? sm,
  required T? md,
  required T? lg,
  required T? xl,
  required T? xxl,
}) {
  final screenData = BootstrapTheme.of(context);
  final breakPoint = screenData.currentBreakPoint;
  final breakPoints = screenData.breakPoints;

  var value;

  if (breakPoint.isBreakPointOrLarger(breakPoints.xs) && xs != null) {
    value = xs;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.sm) && sm != null) {
    value = sm;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.md) && md != null) {
    value = md;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.lg) && lg != null) {
    value = lg;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xl) && xl != null) {
    value = xl;
  }
  if (breakPoint.isBreakPointOrLarger(breakPoints.xxl) && xxl != null) {
    value = xxl;
  }

  return value;
}
