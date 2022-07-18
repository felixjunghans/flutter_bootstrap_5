part of flutter_bootstrap5;

class _WrapperStyle {
  final FB5Margin? margin;
  final FB5Padding? padding;
  final FB5Gutter? gutter;
  final FB5Offset? offset;
  final FB5Display? display;
  final _FB5RowCols? rowCols;
  final FB5Size? size;
  final FB5Order? order;
  final FB5SelfAlignment? selfAlignment;
  final FB5VerticalAlignment? verticalAlignment;
  final FB5HorizontalAlignment? horizontalAlignment;

  _WrapperStyle({
    this.margin,
    this.padding,
    this.gutter,
    this.offset,
    this.display,
    this.rowCols,
    this.size,
    this.order,
    this.selfAlignment,
    this.verticalAlignment,
    this.horizontalAlignment,
  });

  _WrapperStyle copyWith({
    FB5Margin? margin,
    FB5Padding? padding,
    FB5Gutter? gutter,
    FB5Offset? offset,
    FB5Display? display,
    _FB5RowCols? rowCols,
    FB5Size? size,
    FB5Order? order,
    FB5SelfAlignment? selfAlignment,
    FB5VerticalAlignment? verticalAlignment,
    FB5HorizontalAlignment? horizontalAlignment,
  }) =>
      _WrapperStyle(
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        gutter: gutter ?? this.gutter,
        offset: offset ?? this.offset,
        display: display ?? this.display,
        rowCols: rowCols ?? this.rowCols,
        size: size ?? this.size,
        order: order ?? this.order,
        selfAlignment: selfAlignment ?? this.selfAlignment,
        verticalAlignment: verticalAlignment ?? this.verticalAlignment,
        horizontalAlignment: horizontalAlignment ?? this.horizontalAlignment,
      );
}

_WrapperStyle? _convertClassNamesToWrapperStyle(String? classNames) {
  if (classNames == null) return null;

  final classList = classNames.trim().split(" ");
  var style = _WrapperStyle();

  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g m, mt, mb, etc.
    switch (prefix.substring(0, 1)) {
      case 'a':
        if (className.contains('align-items')) {
          var verticalAlignment =
              style.verticalAlignment ?? FB5VerticalAlignment();
          var newVerticalAlignment =
              verticalAlignment._copyWithClass(className);
          style = style.copyWith(verticalAlignment: newVerticalAlignment);
        }

        if (className.contains('align-self')) {
          var selfAlignment =
              style.selfAlignment ?? FB5SelfAlignment();
          var newSelfAlignment =
          selfAlignment._copyWithClass(className);
          style = style.copyWith(selfAlignment: newSelfAlignment);
        }
        break;
      case 'm':
        var margin = style.margin ?? FB5Margin();
        final newMargin = margin._copyWithClass(className) as FB5Margin;
        style = style.copyWith(margin: newMargin);
        break;
      case 'p':
        var padding = style.padding ?? FB5Padding();
        final newPadding = padding._copyWithClass(className) as FB5Padding;
        style = style.copyWith(padding: newPadding);
        break;
      case 'g':
        var gutter = style.gutter ?? FB5Gutter();
        final newGutter = gutter._copyWithClass(className) as FB5Gutter;
        style = style.copyWith(gutter: newGutter);
        break;
      case 'c':
        var size = style.size ?? FB5Size();
        final newSize = size._copyWithClass(className);
        style = style.copyWith(size: newSize);
        break;
      case 'o':
        // o can be order or offset
        if (prefix == 'offset') {
          var offset = style.offset ?? FB5Offset();
          final newOffset = offset._copyWithClass(className);
          style = style.copyWith(offset: newOffset);
          break;
        }

        if (prefix == 'order') {
          var order = style.order ?? FB5Order();
          final newOrder = order._copyWithClass(className);
          style = style.copyWith(order: newOrder);
          break;
        }
        break;
      case 'd':
        var display = style.display ?? FB5Display();
        final newDisplay = display._copyWithClass(className);
        style = style.copyWith(display: newDisplay);
        break;
      case 'r':
        var rowCols = style.rowCols ?? _FB5RowCols();
        final newRowCols = rowCols._copyWithClass(className);
        style = style.copyWith(rowCols: newRowCols);
        break;
      case 'j':
        if (className.contains('justify-content')) {
          var horizontalAlignment =
              style.horizontalAlignment ?? FB5HorizontalAlignment();
          var newHorizontalAlignment =
          horizontalAlignment._copyWithClass(className);
          style = style.copyWith(horizontalAlignment: newHorizontalAlignment);
        }
        break;
    }
  }

  return style;
}
