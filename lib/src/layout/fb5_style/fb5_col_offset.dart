part of flutter_bootstrap5;

class FB5Offset {
  final FB5ColOffset? defaultOffset;
  final FB5ColOffset? xs;
  final FB5ColOffset? sm;
  final FB5ColOffset? md;
  final FB5ColOffset? lg;
  final FB5ColOffset? xl;
  final FB5ColOffset? xxl;

  FB5Offset({
    this.defaultOffset,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Offset _copyWith({
    FB5ColOffset? defaultOffset,
    FB5ColOffset? xs,
    FB5ColOffset? sm,
    FB5ColOffset? md,
    FB5ColOffset? lg,
    FB5ColOffset? xl,
    FB5ColOffset? xxl,
  }) {
    return FB5Offset(
      defaultOffset: defaultOffset ?? this.defaultOffset,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  FB5Offset _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  FB5Offset _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: numerator);
  }

  FB5Offset _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, size: numerator, breakPoint: breakPoint);
  }

  FB5Offset _fromDefinitions({
    required String type,
    int? size,
    String? breakPoint,
  }) {
    if (size == null || size < 0 || size > 12) return this;

    final offset = FB5ColOffset._(numerator: size);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: offset);
      case 'sm':
        return _copyWith(sm: offset);
      case 'md':
        return _copyWith(md: offset);
      case 'lg':
        return _copyWith(lg: offset);
      case 'xl':
        return _copyWith(xl: offset);
      case 'xxl':
        return _copyWith(xxl: offset);
      default:
        return _copyWith(defaultOffset: offset);
    }
  }
}

class FB5ColOffset implements _FB5Sizing {
  const FB5ColOffset._({
    required this.numerator,
  });

  @override
  final int numerator;
}
