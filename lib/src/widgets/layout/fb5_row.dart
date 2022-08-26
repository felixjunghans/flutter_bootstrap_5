part of flutter_bootstrap5;

class FB5Row extends StatelessWidget {
  const FB5Row._({
    Key? key,
    this.style,
    required this.children,
  }) : super(key: key);

  factory FB5Row({
    String? classNames,
    required List<FB5Col> children,
  }) {
    final style = _convertClassNamesToWrapperStyle(classNames);
    return FB5Row._(
      style: style,
      children: children,
    );
  }

  // ignore: library_private_types_in_public_api
  final _WrapperStyle? style;
  final List<FB5Col> children;

  @override
  Widget build(BuildContext context) {
    final display = style?.display;
    final gutter = style?.gutter;
    final offset = style?.offset;
    final padding = style?.padding;
    final margin = style?.margin;
    final rowCols = style?.rowCols;
    final verticalAlignment = style?.verticalAlignment;
    final horizontalAlignment = style?.horizontalAlignment;

    return MediaQueryBuilder(builder: (context, constraints, screenData) {
      final isVisible = screenData.breakPoints._currentDisplay(
        screenData.currentBreakPoint,
        fromStyle: display?.defaultDisplay,
        xs: display?.xs,
        sm: display?.sm,
        md: display?.md,
        lg: display?.lg,
        xl: display?.xl,
        xxl: display?.xxl,
      );

      if (!isVisible) return const SizedBox.shrink();

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

      final co = screenData.breakPoints._currentOffset(
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

      final cp = screenData.breakPoints._currentPadding(
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

      final cm = screenData.breakPoints._currentMargin(
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

      final va = screenData.breakPoints._currentVerticalAlignment(
        screenData.currentBreakPoint,
        fromStyle: verticalAlignment?.defaultAlignment,
        xs: verticalAlignment?.xs,
        sm: verticalAlignment?.sm,
        md: verticalAlignment?.md,
        lg: verticalAlignment?.lg,
        xl: verticalAlignment?.xl,
        xxl: verticalAlignment?.xxl,
      );

      final ha = screenData.breakPoints._currentHorizontalAlignment(
        screenData.currentBreakPoint,
        fromStyle: horizontalAlignment?.defaultAlignment,
        xs: horizontalAlignment?.xs,
        sm: horizontalAlignment?.sm,
        md: horizontalAlignment?.md,
        lg: horizontalAlignment?.lg,
        xl: horizontalAlignment?.xl,
        xxl: horizontalAlignment?.xxl,
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
            child: LayoutBuilder(
              builder: (context, constraints) {
                final rc = screenData.breakPoints._currentRowColsWidth(
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

                return Wrap(
                  alignment: ha ?? WrapAlignment.start,
                  crossAxisAlignment: va ?? WrapCrossAlignment.start,
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
                );
              }
            ),
          ),
        ),
      );
    });
  }
}
