part of flutter_bootstrap5;

class FB5Margin extends _ResponsiveSpacing {
  final FB5ContentMargin? defaultMargin;
  @override
  final FB5ContentMargin? xs;
  @override
  final FB5ContentMargin? sm;
  @override
  final FB5ContentMargin? md;
  @override
  final FB5ContentMargin? lg;
  @override
  final FB5ContentMargin? xl;
  @override
  final FB5ContentMargin? xxl;

  FB5Margin({
    this.defaultMargin,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Margin _copyWith({
    FB5ContentMargin? defaultMargin,
    FB5ContentMargin? xs,
    FB5ContentMargin? sm,
    FB5ContentMargin? md,
    FB5ContentMargin? lg,
    FB5ContentMargin? xl,
    FB5ContentMargin? xxl,
  }) {
    return FB5Margin(
      defaultMargin: this.defaultMargin?._add(defaultMargin) ?? defaultMargin,
      xs: this.xs?._add(xs) ?? xs,
      sm: this.sm?._add(sm) ?? sm,
      md: this.md?._add(md) ?? md,
      lg: this.lg?._add(lg) ?? lg,
      xl: this.xl?._add(xl) ?? xl,
      xxl: this.xxl?._add(xxl) ?? xxl,
    );
  }

  @override
  FB5Margin _fromDefinitions({
    required String type,
    double? size,
    String? breakPoint,
  }) {
    if (size == null) return this;

    FB5ContentMargin? margin;

    switch (type) {
      case 'm':
        margin = FB5ContentMargin._(
            left: size, right: size, top: size, bottom: size);
        break;
      case 'mt':
        margin = FB5ContentMargin._(top: size);
        break;
      case 'mb':
        margin = FB5ContentMargin._(bottom: size);
        break;
      case 'ms':
        margin = FB5ContentMargin._(left: size);
        break;
      case 'me':
        margin = FB5ContentMargin._(right: size);
        break;
      case 'mx':
        margin = FB5ContentMargin._(left: size, right: size);
        break;
      case 'my':
        margin = FB5ContentMargin._(top: size, bottom: size);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: margin);
      case 'sm':
        return _copyWith(sm: margin);
      case 'md':
        return _copyWith(md: margin);
      case 'lg':
        return _copyWith(lg: margin);
      case 'xl':
        return _copyWith(xl: margin);
      case 'xxl':
        return _copyWith(xxl: margin);
      default:
        return _copyWith(defaultMargin: margin);
    }
  }
}

class FB5ContentMargin implements _FB5Spacing {
  @override
  final double? left;
  @override
  final double? right;
  @override
  final double? top;
  @override
  final double? bottom;

  const FB5ContentMargin._({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  FB5ContentMargin _add(FB5ContentMargin? margin) {
    if (margin == null) return this;

    return FB5ContentMargin._(
      left: margin.left ?? left,
      right: margin.right ?? right,
      bottom: margin.bottom ?? bottom,
      top: margin.top ?? top,
    );
  }
}
