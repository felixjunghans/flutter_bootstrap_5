part of flutter_bootstrap5;

class _FB5VerticalAlignment {
  final WrapCrossAlignment? defaultAlignment;
  final WrapCrossAlignment? xs;
  final WrapCrossAlignment? sm;
  final WrapCrossAlignment? md;
  final WrapCrossAlignment? lg;
  final WrapCrossAlignment? xl;
  final WrapCrossAlignment? xxl;

  _FB5VerticalAlignment({
    this.defaultAlignment,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FB5VerticalAlignment _copyWith({
    WrapCrossAlignment? defaultAlignment,
    WrapCrossAlignment? xs,
    WrapCrossAlignment? sm,
    WrapCrossAlignment? md,
    WrapCrossAlignment? lg,
    WrapCrossAlignment? xl,
    WrapCrossAlignment? xxl,
  }) {
    return _FB5VerticalAlignment(
      defaultAlignment: defaultAlignment ?? this.defaultAlignment,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FB5VerticalAlignment _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  WrapCrossAlignment? _fromString(String alignment) {
    switch (alignment) {
      case 'start':
        return WrapCrossAlignment.start;
      case 'center':
        return WrapCrossAlignment.center;
      case 'end':
        return WrapCrossAlignment.end;
    }
    return null;
  }

  _FB5VerticalAlignment _copyWithClass3(List<String> definitions) {
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment);
  }

  _FB5VerticalAlignment _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[2];
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment, breakPoint: breakPoint);
  }

  _FB5VerticalAlignment _fromDefinitions({
    WrapCrossAlignment? alignment,
    String? breakPoint,
  }) {
    if (alignment == null) return this;

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: alignment);
      case 'sm':
        return _copyWith(sm: alignment);
      case 'md':
        return _copyWith(md: alignment);
      case 'lg':
        return _copyWith(lg: alignment);
      case 'xl':
        return _copyWith(xl: alignment);
      case 'xxl':
        return _copyWith(xxl: alignment);
      default:
        return _copyWith(defaultAlignment: alignment);
    }
  }
}
