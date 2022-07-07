part of flutter_bootstrap5;

abstract class _FB5Sizing {
  int get numerator;
}

abstract class _FB5Spacing {
  double? get left;
  double? get right;
  double? get top;
  double? get bottom;
}

abstract class _ResponsiveSpacing {
  _FB5Spacing? get xs;
  _FB5Spacing? get sm;
  _FB5Spacing? get md;
  _FB5Spacing? get lg;
  _FB5Spacing? get xl;
  _FB5Spacing? get xxl;

  double? _sizeFromNumerator(int? numerator) {
    switch (numerator) {
      case 0:
        return 0;
      case 1:
        return 0.25;
      case 2:
        return 0.5;
      case 3:
        return 1.0;
      case 4:
        return 1.5;
      case 5:
        return 3.0;
    }
    return null;
  }

  _ResponsiveSpacing _copyWithClass(String className) {
    final definitions = className.split("-");

    switch (definitions.length) {
      case 2:
        return _copyWithClass2(definitions);
      case 3:
        return _copyWithClass3(definitions);
      case 4:
        return _copyWithClass4(definitions);
    }

    return this;
  }

  /// e.g. 'm-3'
  _ResponsiveSpacing _copyWithClass2(List<String> definitions) {
    final type = definitions.first;
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(type: type, size: _sizeFromNumerator(numerator));
  }

  /// e.g. 'm-lg-3' || 'm-custom-2.5'
  _ResponsiveSpacing _copyWithClass3(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    if (breakPoint == "custom") {
      final numerator = double.tryParse(definitions.last);
      return _fromDefinitions(type: type, size: numerator);
    }
    final numerator = int.tryParse(definitions.last);
    return _fromDefinitions(
        type: type,
        size: _sizeFromNumerator(numerator),
        breakPoint: breakPoint);
  }

  /// e.g. 'm-lg-custom-1.5'
  _ResponsiveSpacing _copyWithClass4(List<String> definitions) {
    final type = definitions.first;
    final breakPoint = definitions[1];
    final numerator = double.tryParse(definitions.last);
    return _fromDefinitions(
        type: type, size: numerator, breakPoint: breakPoint);
  }

  _ResponsiveSpacing _fromDefinitions({
    required String type,
    double? size,
    String? breakPoint,
  });
}
