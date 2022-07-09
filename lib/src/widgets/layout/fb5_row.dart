part of flutter_bootstrap5;

class _RowStyle {
  final FB5Margin? margin;
  final FB5Padding? padding;
  final FB5Gutter? gutter;
  final FB5Offset? offset;
  final _FB5RowCols? rowCols;

  _RowStyle({
    this.margin,
    this.padding,
    this.gutter,
    this.offset,
    this.rowCols,
  });

  _RowStyle copyWith({
    FB5Margin? margin,
    FB5Padding? padding,
    FB5Gutter? gutter,
    FB5Offset? offset,
    _FB5RowCols? rowCols,
  }) =>
      _RowStyle(
        margin: margin ?? this.margin,
        padding: padding ?? this.padding,
        gutter: gutter ?? this.gutter,
        offset: offset ?? this.offset,
        rowCols: rowCols ?? this.rowCols,
      );
}

class FB5Row extends StatelessWidget {
  const FB5Row._({
    Key? key,
    this.style,
    this.alignment = WrapAlignment.start,
    required this.children,
  }) : super(key: key);

  factory FB5Row({
    String? classNames,
    WrapAlignment alignment = WrapAlignment.start,
    required List<FB5Col> children,
  }) {
    final style = _convertClassNamesToRowStyle(classNames);
    return FB5Row._(
      style: style,
      alignment: alignment,
      children: children,
    );
  }

  // ignore: library_private_types_in_public_api
  final _RowStyle? style;

  final List<FB5Col> children;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final gutter = style?.gutter;
    final offset = style?.offset;
    final padding = style?.padding;
    final margin = style?.margin;
    final rowCols = style?.rowCols;

    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      List<FB5Col> sortedChildren = children
        ..sort(
          (a, b) => a
              ._order(constraints, screenData, screenData.currentBreakPoint)
              .compareTo(
                b._order(constraints, screenData, screenData.currentBreakPoint),
              ),
        );

      final cg = screenData.breakPoints.currentGutter(
        screenData.fontSize,
        screenData.currentBreakPoint,
        fromStyle: gutter?.defaultGutter,
        xs: gutter?.xs,
        sm: gutter?.sm,
        md: gutter?.md,
        lg: gutter?.lg,
        xl: gutter?.xl,
        xxl: gutter?.xxl,
      );

      final co = screenData.breakPoints.currentOffset(
        constraints.maxWidth,
        screenData.currentBreakPoint,
        fromStyle: offset?.defaultOffset,
        xs: offset?.xs,
        sm: offset?.sm,
        md: offset?.md,
        lg: offset?.lg,
        xl: offset?.xl,
        xxl: offset?.xxl,
      );

      final cp = screenData.breakPoints.currentPadding(
        screenData.fontSize,
        screenData.currentBreakPoint,
        fromStyle: padding?.defaultPadding,
        xs: padding?.xs,
        sm: padding?.sm,
        md: padding?.md,
        lg: padding?.lg,
        xl: padding?.xl,
        xxl: padding?.xxl,
      );

      final cm = screenData.breakPoints.currentMargin(
        screenData.fontSize,
        screenData.currentBreakPoint,
        fromStyle: margin?.defaultMargin,
        xs: margin?.xs,
        sm: margin?.sm,
        md: margin?.md,
        lg: margin?.lg,
        xl: margin?.xl,
        xxl: margin?.xxl,
      );

      final rc = screenData.breakPoints._currentRowCols(
        constraints.maxWidth,
        screenData.currentBreakPoint,
        fromStyle: rowCols?.defaultOrder,
        xs: rowCols?.xs,
        sm: rowCols?.sm,
        md: rowCols?.md,
        lg: rowCols?.lg,
        xl: rowCols?.xl,
        xxl: rowCols?.xxl,
      );

      return Stack(
        clipBehavior: Clip.none,
        children: [
          Container(),
          Positioned(
            left: -(cg?.left ?? 0.0),
            right: -(cg?.right ?? 0.0),
            top: -(cg?.top ?? 0.0),
            bottom: -(cg?.bottom ?? 0.0),
            child: Container(
              padding: cp,
              margin: cm,
              child: Wrap(
                alignment: alignment,
                spacing: co ?? 0.0,
                children: [
                  ...sortedChildren.map(
                    (e) => e._wrapChild(
                      (child) => Padding(
                        padding: EdgeInsets.only(
                          left: cg?.left ?? 0.0,
                          right: cg?.right ?? 0.0,
                          top: cg?.top ?? 0.0,
                          bottom: cg?.bottom ?? 0.0,
                        ),
                        child: child,
                      ),
                      defaultWidth: rc,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}

_RowStyle? _convertClassNamesToRowStyle(String? classNames) {
  if (classNames == null) return null;

  final classList = classNames.trim().split(" ");
  var style = _RowStyle();

  for (final className in classList) {
    final prefix = className.trim().split("-").first;

    if (prefix.isEmpty) continue;

    // use prefix substring to include all possible classes
    // e.g m, mt, mb, etc.
    switch (prefix.substring(0, 1)) {
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
      case 'o':
        // o can be order or offset
        if (prefix == 'offset') {
          var offset = style.offset ?? FB5Offset();
          final newOffset = offset._copyWithClass(className);
          style = style.copyWith(offset: newOffset);
          break;
        }
        break;
      case 'r':
        var rowCols = style.rowCols ?? _FB5RowCols();
        final newRowCols = rowCols._copyWithClass(className);
        style = style.copyWith(rowCols: newRowCols);
        break;
    }
  }

  return style;
}
