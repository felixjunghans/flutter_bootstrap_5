part of flutter_bootstrap5;

class FB5Gutter extends _ResponsiveSpacing {
  final Gutter? defaultGutter;
  @override
  final Gutter? xs;
  @override
  final Gutter? sm;
  @override
  final Gutter? md;
  @override
  final Gutter? lg;
  @override
  final Gutter? xl;
  @override
  final Gutter? xxl;

  FB5Gutter({
    this.defaultGutter,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Gutter _copyWith({
    Gutter? defaultGutter,
    Gutter? xs,
    Gutter? sm,
    Gutter? md,
    Gutter? lg,
    Gutter? xl,
    Gutter? xxl,
  }) {
    return FB5Gutter(
      defaultGutter: this.defaultGutter?._add(defaultGutter) ?? defaultGutter,
      xs: this.xs?._add(xs) ?? xs,
      sm: this.sm?._add(sm) ?? sm,
      md: this.md?._add(md) ?? md,
      lg: this.lg?._add(lg) ?? lg,
      xl: this.xl?._add(xl) ?? xl,
      xxl: this.xxl?._add(xxl) ?? xxl,
    );
  }

  @override
  FB5Gutter _fromDefinitions(
      {required String type, double? size, String? breakPoint}) {
    if (size == null) return this;

    Gutter? gutter;

    switch (type) {
      case 'g':
        gutter = Gutter._(left: size, right: size, top: size, bottom: size);
        break;
      case 'gx':
        gutter = Gutter._(left: size, right: size);
        break;
      case 'gy':
        gutter = Gutter._(top: size, bottom: size);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: gutter);
      case 'sm':
        return _copyWith(sm: gutter);
      case 'md':
        return _copyWith(md: gutter);
      case 'lg':
        return _copyWith(lg: gutter);
      case 'xl':
        return _copyWith(xl: gutter);
      case 'xxl':
        return _copyWith(xxl: gutter);
      default:
        return _copyWith(defaultGutter: gutter);
    }
  }
}

class Gutter implements _FB5Spacing {
  @override
  final double? left;
  @override
  final double? right;
  @override
  final double? top;
  @override
  final double? bottom;

  const Gutter._({
    this.left,
    this.right,
    this.top,
    this.bottom,
  });

  Gutter? _add(Gutter? gutter) {
    if (gutter == null) return null;

    return Gutter._(
      left: gutter.left ?? left,
      right: gutter.right ?? right,
      bottom: gutter.bottom ?? bottom,
      top: gutter.top ?? top,
    );
  }
}
