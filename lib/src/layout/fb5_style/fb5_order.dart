part of flutter_bootstrap5;

class _FB5Order {
  final _FB5OrderNumber? defaultOrder;
  final _FB5OrderNumber? xs;
  final _FB5OrderNumber? sm;
  final _FB5OrderNumber? md;
  final _FB5OrderNumber? lg;
  final _FB5OrderNumber? xl;
  final _FB5OrderNumber? xxl;

  _FB5Order({
    this.defaultOrder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FB5Order _copyWith({
    _FB5OrderNumber? defaultOrder,
    _FB5OrderNumber? xs,
    _FB5OrderNumber? sm,
    _FB5OrderNumber? md,
    _FB5OrderNumber? lg,
    _FB5OrderNumber? xl,
    _FB5OrderNumber? xxl,
  }) {
    return _FB5Order(
      defaultOrder: defaultOrder ?? this.defaultOrder,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FB5Order _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _FB5Order _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, order: numerator);
  }

  _FB5Order _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, order: numerator, breakPoint: breakPoint);
  }

  _FB5Order _fromDefinitions({
    required String type,
    int? order,
    String? breakPoint,
  }) {
    if (order == null || order < 0) return this;

    final orderNumber = _FB5OrderNumber._(order: order);

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: orderNumber);
      case 'sm':
        return _copyWith(sm: orderNumber);
      case 'md':
        return _copyWith(md: orderNumber);
      case 'lg':
        return _copyWith(lg: orderNumber);
      case 'xl':
        return _copyWith(xl: orderNumber);
      case 'xxl':
        return _copyWith(xxl: orderNumber);
      default:
        return _copyWith(defaultOrder: orderNumber);
    }
  }
}

class _FB5OrderNumber {
  const _FB5OrderNumber._({
    required this.order,
  });

  final int order;
}
