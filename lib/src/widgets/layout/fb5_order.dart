part of flutter_bootstrap5;

abstract class _FB5OrderWidget extends StatelessWidget {
  const _FB5OrderWidget({Key? key }) : super(key: key);

  _WrapperStyle? get style;

  int _order(BoxConstraints constraints, ScreenData screenData,
      BreakPoint currentBreakPoint) {
    final order = style?.order;

    return screenData.breakPoints._currentOrder(
      constraints.maxWidth,
      currentBreakPoint,
      fromStyle: order?.defaultOrder,
      xs: order?.xs,
      sm: order?.sm,
      md: order?.md,
      lg: order?.lg,
      xl: order?.xl,
      xxl: order?.xxl,
    );
  }
}
