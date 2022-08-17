part of flutter_bootstrap5;

class FB5Grid extends StatelessWidget {
  const FB5Grid._({
    Key? key,
    this.style,
    this.maxChildExpand,
    this.intrinsicHeight = true,
    this.sortChildren = false,
    required this.children,
  }) : super(key: key);

  factory FB5Grid({
    String? classNames,
    bool sortChildren = false,
    required List<Widget> children,
  }) {
    final style = _convertClassNamesToWrapperStyle(classNames);
    return FB5Grid._(
      style: style,
      sortChildren: sortChildren,
      children: children,
    );
  }

  factory FB5Grid.stacked({
    String? classNames,
    bool sortChildren = false,
    required double maxChildExpand,
    required List<Widget> children,
  }) {
    final style = _convertClassNamesToWrapperStyle(classNames);
    return FB5Grid._(
      style: style,
      intrinsicHeight: false,
      maxChildExpand: maxChildExpand,
      sortChildren: sortChildren,
      children: children,
    );
  }

  // ignore: library_private_types_in_public_api
  final _WrapperStyle? style;
  final bool intrinsicHeight;
  final double? maxChildExpand;
  final List<Widget> children;
  final bool sortChildren;

  MainAxisAlignment? _convertAlignment(WrapAlignment? alignment) {
    switch (alignment) {
      case WrapAlignment.start:
        return MainAxisAlignment.start;
      case WrapAlignment.end:
        return MainAxisAlignment.end;
      case WrapAlignment.center:
        return MainAxisAlignment.center;
      case WrapAlignment.spaceBetween:
        return MainAxisAlignment.spaceBetween;
      case WrapAlignment.spaceAround:
        return MainAxisAlignment.spaceAround;
      case WrapAlignment.spaceEvenly:
        return MainAxisAlignment.spaceEvenly;
      default:
        return null;
    }
  }

  CrossAxisAlignment? _convertCrossAlignment(WrapCrossAlignment? alignment) {
    switch (alignment) {
      case WrapCrossAlignment.start:
        return CrossAxisAlignment.start;
      case WrapCrossAlignment.end:
        return CrossAxisAlignment.end;
      case WrapCrossAlignment.center:
        return CrossAxisAlignment.center;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final display = style?.display;
    final gutter = style?.gutter;
    final padding = style?.padding;
    final margin = style?.margin;
    final rowCols = style?.rowCols;
    final verticalAlignment = style?.verticalAlignment;
    final horizontalAlignment = style?.horizontalAlignment;

    return MediaQueryBuilder(
      builder: (context, constraints, screenData) {
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

        if (!isVisible) return const SizedBox.shrink();

        List<Widget> sortedChildren;
        if (sortChildren) {
          sortedChildren = children
            ..sort(
              (a, b) {
                final aOrder = a is _FB5OrderWidget
                    ? a._order(
                        constraints, screenData, screenData.currentBreakPoint)
                    : 0;
                var bOrder = b is _FB5OrderWidget
                    ? b._order(
                        constraints, screenData, screenData.currentBreakPoint)
                    : 0;
                return aOrder.compareTo(bOrder);
              },
            );
        } else {
          sortedChildren = children;
        }

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
          screenData.currentBreakPoint,
          fromStyle: rowCols?.defaultOrder,
          xs: rowCols?.xs,
          sm: rowCols?.sm,
          md: rowCols?.md,
          lg: rowCols?.lg,
          xl: rowCols?.xl,
          xxl: rowCols?.xxl,
        );

        final va = _convertCrossAlignment(
            screenData.breakPoints._currentVerticalAlignment(
          screenData.currentBreakPoint,
          fromStyle: verticalAlignment?.defaultAlignment,
          xs: verticalAlignment?.xs,
          sm: verticalAlignment?.sm,
          md: verticalAlignment?.md,
          lg: verticalAlignment?.lg,
          xl: verticalAlignment?.xl,
          xxl: verticalAlignment?.xxl,
        ));

        final ha = _convertAlignment(
            screenData.breakPoints._currentHorizontalAlignment(
          screenData.currentBreakPoint,
          fromStyle: horizontalAlignment?.defaultAlignment,
          xs: horizontalAlignment?.xs,
          sm: horizontalAlignment?.sm,
          md: horizontalAlignment?.md,
          lg: horizontalAlignment?.lg,
          xl: horizontalAlignment?.xl,
          xxl: horizontalAlignment?.xxl,
        ));

        final hp = (cg?.left ?? 0.0) + (cg?.right ?? 0.0);

        return Container(
          margin: cm,
          padding: cp,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ...sortedChildren.slices(rc).map<Widget>(
                  (slice) {
                    final maxWidth =
                        (constraints.maxWidth - (hp * (rc - 1))) / rc;

                    final child = Row(
                      mainAxisAlignment: ha ?? MainAxisAlignment.start,
                      crossAxisAlignment: va ?? CrossAxisAlignment.stretch,
                      children: [
                        ...slice
                            .map<Widget>(
                              (e) => ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: maxWidth,
                                ),
                                child: e,
                              ),
                            )
                            .intersperse(
                              SizedBox(
                                width: hp,
                              ),
                            ),
                      ],
                    );

                    if (!intrinsicHeight) {
                      return ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: maxChildExpand!),
                        child: child,
                      );
                    }

                    return IntrinsicHeight(
                      child: child,
                    );
                  },
                ).intersperse(
                  SizedBox(
                    height: (cg?.top ?? 0.0) + (cg?.bottom ?? 0.0),
                  ),
                ),
              ],
            );
            },
          ),
        );
      },
    );
  }
}
