part of flutter_bootstrap5;

enum _ContainerBreakPoint { sm, md, lg, xl, xxl, fluid }

class FB5Container extends StatelessWidget {
  const FB5Container._({
    Key? key,
    this.child,
    this.containerBreakPoint,
    this.alignment = Alignment.center,
  }) : super(key: key);

  factory FB5Container({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        child: child,
      );

  factory FB5Container.sm({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.sm,
        child: child,
      );

  factory FB5Container.md({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.md,
        child: child,
      );

  factory FB5Container.lg({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.lg,
        child: child,
      );

  factory FB5Container.xl({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.xl,
        child: child,
      );

  factory FB5Container.xxl({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.xxl,
        child: child,
      );

  factory FB5Container.fluid({
    Key? key,
    Alignment alignment = Alignment.center,
    Widget? child,
  }) =>
      FB5Container._(
        key: key,
        alignment: alignment,
        containerBreakPoint: _ContainerBreakPoint.fluid,
        child: child,
      );

  final Widget? child;
  // ignore: library_private_types_in_public_api
  final _ContainerBreakPoint? containerBreakPoint;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return MediaQueryBuilder(builder: (context, constraints, data) {
      final breakPoint = data.currentBreakPoint;
      double maxWidth = double.infinity;

      if (breakPoint.isBreakPointOrLarger(data.breakPoints.xs)) {
        maxWidth = data.containerBreakPoints.xs;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.sm)) {
        maxWidth = data.containerBreakPoints.sm;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.md)) {
        maxWidth = data.containerBreakPoints.md;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.lg)) {
        maxWidth = data.containerBreakPoints.lg;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.xl)) {
        maxWidth = data.containerBreakPoints.xl;
      }
      if (breakPoint.isBreakPointOrLarger(data.breakPoints.xxl)) {
        maxWidth = data.containerBreakPoints.xxl;
      }

      switch (containerBreakPoint) {
        case _ContainerBreakPoint.sm:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.xs)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.md:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.sm)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.lg:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.md)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.xl:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.lg)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.xxl:
          if (breakPoint.isBreakPointOrSmaller(data.breakPoints.xl)) {
            maxWidth = double.infinity;
          }
          break;
        case _ContainerBreakPoint.fluid:
          maxWidth = double.infinity;
          break;
        case null:
          break;
      }

      return Align(
        alignment: alignment,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: maxWidth,
          ),
          child: child,
        ),
      );
    });
  }
}
