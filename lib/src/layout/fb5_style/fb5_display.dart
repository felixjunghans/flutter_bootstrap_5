part of flutter_bootstrap5;

class _FB5Display {
  final _FB5ContentDisplay? defaultDisplay;
  final _FB5ContentDisplay? xs;
  final _FB5ContentDisplay? sm;
  final _FB5ContentDisplay? md;
  final _FB5ContentDisplay? lg;
  final _FB5ContentDisplay? xl;
  final _FB5ContentDisplay? xxl;

  _FB5Display({
    this.defaultDisplay,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xxl,
  });

  _FB5Display _copyWith({
    _FB5ContentDisplay? defaultDisplay,
    _FB5ContentDisplay? xs,
    _FB5ContentDisplay? sm,
    _FB5ContentDisplay? md,
    _FB5ContentDisplay? lg,
    _FB5ContentDisplay? xl,
    _FB5ContentDisplay? xxl,
  }) {
    return _FB5Display(
      defaultDisplay: defaultDisplay ?? this.defaultDisplay,
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
      xl: xl ?? this.xl,
      xxl: xxl ?? this.xxl,
    );
  }

  _FB5Display _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
    }

    return this;
  }

  _FB5Display _copyWithClass2(List<String> definitions) {
    final type = definitions.last;
    return _fromDefinitions(type: type);
  }

  _FB5Display _copyWithClass3(List<String> definitions) {
    final type = definitions.last;
    final breakPoint = definitions[1];
    return _fromDefinitions(
        type: type,
        breakPoint: breakPoint);
  }

  _FB5Display _fromDefinitions({
    required String type,
    String? breakPoint,
  }) {
    _FB5ContentDisplay? display;

    switch (type) {
      case 'none':
        display = const _FB5ContentDisplay._(visible: false);
        break;
      case 'block':
        display = const _FB5ContentDisplay._(visible: true);
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

class _FB5ContentDisplay {
  final bool visible;

  const _FB5ContentDisplay._({
    this.visible = true,
  });
}
