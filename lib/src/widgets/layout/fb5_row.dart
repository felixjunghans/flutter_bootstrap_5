part of flutter_bootstrap5;

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
    final style = _convertClassNamesToWrapperStyle(classNames);
    return FB5Row._(
      style: style,
      alignment: alignment,
      children: children,
    );
  }

  // ignore: library_private_types_in_public_api
  final _WrapperStyle? style;

  final List<FB5Col> children;
  final WrapAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final display = style?.display;
    final gutter = style?.gutter;
    final offset = style?.offset;
    final padding = style?.padding;
    final margin = style?.margin;
    final rowCols = style?.rowCols;

    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final isVisible = screenData.breakPoints.currentDisplay(
        screenData.currentBreakPoint,
        fromStyle: display?.defaultDisplay,
        xs: display?.xs,
        sm: display?.sm,
        md: display?.md,
        lg: display?.lg,
        xl: display?.xl,
        xxl: display?.xxl,
      );

      if(!isVisible) return const SizedBox.shrink();

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

      final maxWidthHorizontalGutter =
          constraints.maxWidth + (cg?.left ?? 0.0) + (cg?.right ?? 0.0);

      final co = screenData.breakPoints.currentOffset(
        maxWidthHorizontalGutter,
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
        maxWidthHorizontalGutter,
        screenData.currentBreakPoint,
        fromStyle: rowCols?.defaultOrder,
        xs: rowCols?.xs,
        sm: rowCols?.sm,
        md: rowCols?.md,
        lg: rowCols?.lg,
        xl: rowCols?.xl,
        xxl: rowCols?.xxl,
      );

      final widthFactor = double.parse(
              (1 / constraints.maxWidth * maxWidthHorizontalGutter)
                  .toStringAsFixed(4)) +
          0.0001;

      return FractionallySizedBox(
        heightFactor: null,
        widthFactor: widthFactor,
        child: Transform.translate(
          offset: Offset(0.0, -(cg?.top ?? 0.0)),
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
      );
    });
  }
}
