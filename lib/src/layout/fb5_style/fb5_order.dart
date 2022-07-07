part of flutter_bootstrap5;

class FB5Order {
  final FB5OrderNumber? defaultOrder;
  final FB5OrderNumber? xs;
  final FB5OrderNumber? sm;
  final FB5OrderNumber? md;
  final FB5OrderNumber? lg;
  final FB5OrderNumber? xl;
  final FB5OrderNumber? xxl;

  FB5Order({
    this.defaultOrder,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Order _copyWith({
    FB5OrderNumber? defaultOrder,
    FB5OrderNumber? xs,
    FB5OrderNumber? sm,
    FB5OrderNumber? md,
    FB5OrderNumber? lg,
    FB5OrderNumber? xl,
    FB5OrderNumber? xxl,
  }) {
    return FB5Order(
      defaultOrder: defaultOrder ?? this.defaultOrder,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  FB5Order _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  FB5Order _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, order: numerator);
  }

  FB5Order _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, order: numerator, breakPoint: breakPoint);
  }

  FB5Order _fromDefinitions({
    required String type,
    int? order,
    String? breakPoint,
  }) {
    if (order == null || order < 0) return this;

    final orderNumber = FB5OrderNumber._(order: order);

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

class FB5OrderNumber {
  const FB5OrderNumber._({
    required this.order,
  });

  final int order;
}
