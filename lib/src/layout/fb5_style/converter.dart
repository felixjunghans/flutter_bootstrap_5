part of flutter_bootstrap5;

class _WrapperStyle {
  final _FB5Margin? margin;
  final _FB5Padding? padding;
  final _FB5Gutter? gutter;
  final _FB5Offset? offset;
  final _FB5Display? display;
  final _FB5RowCols? rowCols;
  final _FB5Size? size;
  final _FB5Order? order;
  final _FB5SelfAlignment? selfAlignment;
  final _FB5VerticalAlignment? verticalAlignment;
  final _FB5HorizontalAlignment? horizontalAlignment;

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
    _FB5Margin? margin,
    _FB5Padding? padding,
    _FB5Gutter? gutter,
    _FB5Offset? offset,
    _FB5Display? display,
    _FB5RowCols? rowCols,
    _FB5Size? size,
    _FB5Order? order,
    _FB5SelfAlignment? selfAlignment,
    _FB5VerticalAlignment? verticalAlignment,
    _FB5HorizontalAlignment? horizontalAlignment,
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
              style.verticalAlignment ?? _FB5VerticalAlignment();
          var newVerticalAlignment =
              verticalAlignment._copyWithClass(className);
          style = style.copyWith(verticalAlignment: newVerticalAlignment);
        }

        if (className.contains('align-self')) {
          var selfAlignment =
              style.selfAlignment ?? _FB5SelfAlignment();
          var newSelfAlignment =
          selfAlignment._copyWithClass(className);
          style = style.copyWith(selfAlignment: newSelfAlignment);
        }
        break;
      case 'm':
        var margin = style.margin ?? _FB5Margin();
        final newMargin = margin._copyWithClass(className) as _FB5Margin;
        style = style.copyWith(margin: newMargin);
        break;
      case 'p':
        var padding = style.padding ?? _FB5Padding();
        final newPadding = padding._copyWithClass(className) as _FB5Padding;
        style = style.copyWith(padding: newPadding);
        break;
      case 'g':
        var gutter = style.gutter ?? _FB5Gutter();
        final newGutter = gutter._copyWithClass(className) as _FB5Gutter;
        style = style.copyWith(gutter: newGutter);
        break;
      case 'c':
        var size = style.size ?? _FB5Size();
        final newSize = size._copyWithClass(className);
        style = style.copyWith(size: newSize);
        break;
      case 'o':
        // o can be order or offset
        if (prefix == 'offset') {
          var offset = style.offset ?? _FB5Offset();
          final newOffset = offset._copyWithClass(className);
          style = style.copyWith(offset: newOffset);
          break;
        }

        if (prefix == 'order') {
          var order = style.order ?? _FB5Order();
          final newOrder = order._copyWithClass(className);
          style = style.copyWith(order: newOrder);
          break;
        }
        break;
      case 'd':
        var display = style.display ?? _FB5Display();
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
              style.horizontalAlignment ?? _FB5HorizontalAlignment();
          var newHorizontalAlignment =
          horizontalAlignment._copyWithClass(className);
          style = style.copyWith(horizontalAlignment: newHorizontalAlignment);
        }
        break;
    }
  }

  return style;
}
