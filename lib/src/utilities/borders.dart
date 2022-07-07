part of flutter_bootstrap5;

Border borderPrimary(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.primary.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderSecondary(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.secondary.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderSuccess(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.success.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderDanger(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.danger.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderWarning(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.warning.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderInfo(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.info.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderLight(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.light.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderDark(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.dark.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

Border borderWhite(
  BuildContext context, {
  double opacity = 1.0,
  double width = 1.0,
  BorderStyle style = BorderStyle.solid,
  BorderSide? top,
  BorderSide? left,
  BorderSide? right,
  BorderSide? bottom,
}) {
  final theme = BootstrapTheme.of(context);
  final borderSide = BorderSide(
      width: width,
      color: theme.colors.white.withOpacity(opacity),
      style: style);
  return Border(
    top: top ?? borderSide,
    left: left ?? borderSide,
    right: right ?? borderSide,
    bottom: bottom ?? borderSide,
  );
}

BorderRadius rounded0() => BorderRadius.zero;

BorderRadius rounded(BuildContext context) {
  final theme = BootstrapTheme.of(context);
  return BorderRadius.all(Radius.circular(theme.fontSize * 0.375));
}

BorderRadius rounded1(BuildContext context) {
  final theme = BootstrapTheme.of(context);
  return BorderRadius.all(Radius.circular(theme.fontSize * 0.25));
}

BorderRadius rounded2(BuildContext context) => rounded(context);

BorderRadius rounded3(BuildContext context) {
  final theme = BootstrapTheme.of(context);
  return BorderRadius.all(Radius.circular(theme.fontSize * 0.5));
}

BorderRadius rounded4(BuildContext context) {
  final theme = BootstrapTheme.of(context);
  return BorderRadius.all(Radius.circular(theme.fontSize * 1));
}

BorderRadius rounded5(BuildContext context) {
  final theme = BootstrapTheme.of(context);
  return BorderRadius.all(Radius.circular(theme.fontSize * 2));
}

BorderRadius roundedPill(BuildContext context) {
  final theme = BootstrapTheme.of(context);
  return BorderRadius.all(Radius.circular(theme.fontSize * 50));
}
