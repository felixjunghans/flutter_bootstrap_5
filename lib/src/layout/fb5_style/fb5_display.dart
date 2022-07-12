part of flutter_bootstrap5;

class FB5Display {
  final FB5ContentDisplay? defaultDisplay;
  final FB5ContentDisplay? xs;
  final FB5ContentDisplay? sm;
  final FB5ContentDisplay? md;
  final FB5ContentDisplay? lg;
  final FB5ContentDisplay? xl;
  final FB5ContentDisplay? xxl;

  FB5Display({
    this.defaultDisplay,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  FB5Display _copyWith({
    FB5ContentDisplay? defaultDisplay,
    FB5ContentDisplay? xs,
    FB5ContentDisplay? sm,
    FB5ContentDisplay? md,
    FB5ContentDisplay? lg,
    FB5ContentDisplay? xl,
    FB5ContentDisplay? xxl,
  }) {
    return FB5Display(
      defaultDisplay: defaultDisplay ?? this.defaultDisplay,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  FB5Display _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  FB5Display _copyWithClass2(List<String> definitions) {
    final type = definitions.last;
    return _fromDefinitions(type: type);
  }

  FB5Display _copyWithClass3(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    return _fromDefinitions(
        type: type,
        breakPoint: breakPoint);
  }

  FB5Display _fromDefinitions({
    required String type,
    String? breakPoint,
  }) {
    FB5ContentDisplay? display;

    switch (type) {
      case 'none':
        display = const FB5ContentDisplay._(visible: false);
        break;
      case 'block':
        display = const FB5ContentDisplay._(visible: true);
        break;
    }

    switch (breakPoint) {
      case 'xs':
        return _copyWith(xs: display);
      case 'sm':
        return _copyWith(sm: display);
      case 'md':
        return _copyWith(md: display);
      case 'lg':
        return _copyWith(lg: display);
      case 'xl':
        return _copyWith(xl: display);
      case 'xxl':
        return _copyWith(xxl: display);
      default:
        return _copyWith(defaultDisplay: display);
    }
  }
}

class FB5ContentDisplay {
  final bool visible;

  const FB5ContentDisplay._({
    this.visible = true,
  });
}
