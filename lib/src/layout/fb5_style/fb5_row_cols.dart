part of flutter_bootstrap5;

class _FB5RowCols {
  final _FB5RowColsNumber? defaultOrder;
  final _FB5RowColsNumber? xs;
  final _FB5RowColsNumber? sm;
  final _FB5RowColsNumber? md;
  final _FB5RowColsNumber? lg;
  final _FB5RowColsNumber? xl;
  final _FB5RowColsNumber? xxl;

  _FB5RowCols({
    this.defaultOrder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FB5RowCols _copyWith({
    _FB5RowColsNumber? defaultOrder,
    _FB5RowColsNumber? xs,
    _FB5RowColsNumber? sm,
    _FB5RowColsNumber? md,
    _FB5RowColsNumber? lg,
    _FB5RowColsNumber? xl,
    _FB5RowColsNumber? xxl,
  }) {
    return _FB5RowCols(
      defaultOrder: defaultOrder ?? this.defaultOrder,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FB5RowCols _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  _FB5RowCols _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, cols: numerator);
  }

  _FB5RowCols _copyWithClass4(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[2];
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, cols: numerator, breakPoint: breakPoint);
  }

  _FB5RowCols _fromDefinitions({
    required String type,
    int? cols,
    String? breakPoint,
  }) {
    if (cols == null || cols < 0) return this;

    final colsNumber = _FB5RowColsNumber._(cols: cols);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: colsNumber);
      case 'sm':
        return _copyWith(sm: colsNumber);
      case 'md':
        return _copyWith(md: colsNumber);
      case 'lg':
        return _copyWith(lg: colsNumber);
      case 'xl':
        return _copyWith(xl: colsNumber);
      case 'xxl':
        return _copyWith(xxl: colsNumber);
      default:
        return _copyWith(defaultOrder: colsNumber);
    }
  }
}

class _FB5RowColsNumber {
  const _FB5RowColsNumber._({
    required this.cols,
  });

  final int cols;
}
