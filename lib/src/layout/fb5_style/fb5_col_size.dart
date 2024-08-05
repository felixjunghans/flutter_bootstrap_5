part of flutter_bootstrap5;

class _FB5Size {
  final _FB5ColSize? defaultSize;
  final _FB5ColSize? xs;
  final _FB5ColSize? sm;
  final _FB5ColSize? md;
  final _FB5ColSize? lg;
  final _FB5ColSize? xl;
  final _FB5ColSize? xxl;

  _FB5Size({
    this.defaultSize,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FB5Size _copyWith({
    _FB5ColSize? defaultSize,
    _FB5ColSize? xs,
    _FB5ColSize? sm,
    _FB5ColSize? md,
    _FB5ColSize? lg,
    _FB5ColSize? xl,
    _FB5ColSize? xxl,
  }) {
    return _FB5Size(
      defaultSize: defaultSize ?? this.defaultSize,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FB5Size _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _FB5Size _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: numerator);
  }

  _FB5Size _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, size: numerator, breakPoint: breakPoint);
  }

  _FB5Size _fromDefinitions({
    required String type,
    int? size,
    String? breakPoint,
  }) {
    if (size == null || size < 0 || size > 12) return this;

    final colSize = _FB5ColSize._(numerator: size);


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

class _FB5ColSize implements _FB5Sizing {
  const _FB5ColSize._({
    required this.numerator,
  });

  @override
  final int numerator;
}
