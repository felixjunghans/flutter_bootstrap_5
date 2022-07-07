part of flutter_bootstrap5;

typedef MediaQueryBuilderFunction = Widget Function(
  BuildContext context,
  BoxConstraints constraints,
  ScreenData data,
);

class MediaQueryBuilder extends StatelessWidget {
  const MediaQueryBuilder({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final MediaQueryBuilderFunction builder;

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        final screenData = BootstrapTheme.of(context);
        return builder(
          context,
          constraints,
          screenData,
        );
      });
}
