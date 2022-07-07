part of flutter_bootstrap5;

class FB5Padding extends _ResponsiveSpacing {
  final FB5ContentPadding? defaultPadding;
  @override
  final FB5ContentPadding? xs;
  @override
  final FB5ContentPadding? sm;
  @override
  final FB5ContentPadding? md;
  @override
  final FB5ContentPadding? lg;
  @override
  final FB5ContentPadding? xl;
  @override
  final FB5ContentPadding? xxl;

  FB5Padding({
    this.defaultPadding,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Padding _copyWith({
    FB5ContentPadding? defaultPadding,
    FB5ContentPadding? xs,
    FB5ContentPadding? sm,
    FB5ContentPadding? md,
    FB5ContentPadding? lg,
    FB5ContentPadding? xl,
    FB5ContentPadding? xxl,
  }) {
    return FB5Padding(
      defaultPadding:
          this.defaultPadding?._add(defaultPadding) ?? defaultPadding,
      xs: this.xs?._add(xs) ?? xs,
      sm: this.sm?._add(sm) ?? sm,
      md: this.md?._add(md) ?? md,
      lg: this.lg?._add(lg) ?? lg,
      xl: this.xl?._add(xl) ?? xl,
      xxl: this.xxl?._add(xxl) ?? xxl,
    );
  }

  @override
  FB5Padding _fromDefinitions(
      {required String type, double? size, String? breakPoint}) {
    if (size == null) return this;

    FB5ContentPadding? padding;

    switch (type) {
      case 'p':
        padding = FB5ContentPadding._(
            left: size, right: size, top: size, bottom: size);
        break;
      case 'pt':
        padding = FB5ContentPadding._(top: size);
        break;
      case 'pb':
        padding = FB5ContentPadding._(bottom: size);
        break;
      case 'ps':
        padding = FB5ContentPadding._(left: size);
        break;
      case 'pe':
        padding = FB5ContentPadding._(right: size);
        break;
      case 'px':
        padding = FB5ContentPadding._(left: size, right: size);
        break;
      case 'py':
        padding = FB5ContentPadding._(top: size, bottom: size);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: padding);
      case 'sm':
        return _copyWith(sm: padding);
      case 'md':
        return _copyWith(md: padding);
      case 'lg':
        return _copyWith(lg: padding);
      case 'xl':
        return _copyWith(xl: padding);
      case 'xxl':
        return _copyWith(xxl: padding);
      default:
        return _copyWith(defaultPadding: padding);
    }
  }
}

class FB5ContentPadding implements _FB5Spacing {
  @override
  final double? left;
  @override
  final double? right;
  @override
  final double? top;
  @override
  final double? bottom;

  const FB5ContentPadding._({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  FB5ContentPadding? _add(FB5ContentPadding? padding) {
    if (padding == null) return this;

    return FB5ContentPadding._(
      left: padding.left ?? left,
      right: padding.right ?? right,
      bottom: padding.bottom ?? bottom,
      top: padding.top ?? top,
    );
  }
}
