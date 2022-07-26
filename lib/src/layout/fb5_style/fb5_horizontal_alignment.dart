part of flutter_bootstrap5;

class FB5HorizontalAlignment {
  final WrapAlignment? defaultAlignment;
  final WrapAlignment? xs;
  final WrapAlignment? sm;
  final WrapAlignment? md;
  final WrapAlignment? lg;
  final WrapAlignment? xl;
  final WrapAlignment? xxl;

  FB5HorizontalAlignment({
    this.defaultAlignment,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5HorizontalAlignment _copyWith({
    WrapAlignment? defaultAlignment,
    WrapAlignment? xs,
    WrapAlignment? sm,
    WrapAlignment? md,
    WrapAlignment? lg,
    WrapAlignment? xl,
    WrapAlignment? xxl,
  }) {
    return FB5HorizontalAlignment(
      defaultAlignment: defaultAlignment ?? this.defaultAlignment,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  FB5HorizontalAlignment _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  WrapAlignment? _fromString(String alignment) {
    switch(alignment) {
      case 'start': return WrapAlignment.start;
      case 'around': return WrapAlignment.spaceAround;
      case 'between': return WrapAlignment.spaceBetween;
      case 'evenly': return WrapAlignment.spaceEvenly;
      case 'center': return WrapAlignment.center;
      case 'end': return WrapAlignment.end;
    }
    return null;
  }

  FB5HorizontalAlignment _copyWithClass3(List<String> definitions) {
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment);
  }

  FB5HorizontalAlignment _copyWithClass4(List<String> definitions) {
    final breakPoint = definitions[2];
    final alignment = _fromString(definitions.last);
    return _fromDefinitions(alignment: alignment, breakPoint: breakPoint);
  }

  FB5HorizontalAlignment _fromDefinitions({
    WrapAlignment? alignment,
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
