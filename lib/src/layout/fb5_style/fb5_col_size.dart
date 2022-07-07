part of flutter_bootstrap5;

class FB5Size {
  final FB5ColSize? defaultSize;
  final FB5ColSize? xs;
  final FB5ColSize? sm;
  final FB5ColSize? md;
  final FB5ColSize? lg;
  final FB5ColSize? xl;
  final FB5ColSize? xxl;

  FB5Size({
    this.defaultSize,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Size _copyWith({
    FB5ColSize? defaultSize,
    FB5ColSize? xs,
    FB5ColSize? sm,
    FB5ColSize? md,
    FB5ColSize? lg,
    FB5ColSize? xl,
    FB5ColSize? xxl,
  }) {
    return FB5Size(
      defaultSize: defaultSize ?? this.defaultSize,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  FB5Size _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  FB5Size _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: numerator);
  }

  FB5Size _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, size: numerator, breakPoint: breakPoint);
  }

  FB5Size _fromDefinitions({
    required String type,
    int? size,
    String? breakPoint,
  }) {
    if (size == null || size < 0 || size > 12) return this;

    final colSize = FB5ColSize._(numerator: size);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: colSize);
      case 'sm':
        return _copyWith(sm: colSize);
      case 'md':
        return _copyWith(md: colSize);
      case 'lg':
        return _copyWith(lg: colSize);
      case 'xl':
        return _copyWith(xl: colSize);
      case 'xxl':
        return _copyWith(xxl: colSize);
      default:
        return _copyWith(defaultSize: colSize);
    }
  }
}

class FB5ColSize implements _FB5Sizing {
  const FB5ColSize._({
    required this.numerator,
  });

  @override
  final int numerator;
}
