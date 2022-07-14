part of flutter_bootstrap5;

class BootstrapTypography {
  static const FB5TextSetting h1 = FB5TextSetting(
    fontSizeMultiplier: 2.5,
    fontSizeMultiplierSmall: 1.375,
    viewPortMultiplier: 1.5,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const FB5TextSetting h2 = FB5TextSetting(
    fontSizeMultiplier: 2.0,
    fontSizeMultiplierSmall: 1.325,
    viewPortMultiplier: 0.9,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const FB5TextSetting h3 = FB5TextSetting(
    fontSizeMultiplier: 1.75,
    fontSizeMultiplierSmall: 1.3,
    viewPortMultiplier: 0.6,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const FB5TextSetting h4 = FB5TextSetting(
    fontSizeMultiplier: 1.5,
    fontSizeMultiplierSmall: 1.275,
    viewPortMultiplier: 0.3,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const FB5TextSetting h5 = FB5TextSetting(
    fontSizeMultiplier: 1.25,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );
  static const FB5TextSetting h6 = FB5TextSetting(
    fontSizeMultiplier: 1.0,
    style: TextStyle(
      fontWeight: FontWeight.w500,
      height: 1.2,
    ),
  );

  static const FB5TextSetting display1 = FB5TextSetting(
    fontSizeMultiplier: 5.0,
    fontSizeMultiplierSmall: 1.625,
    viewPortMultiplier: 4.5,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const FB5TextSetting display2 = FB5TextSetting(
    fontSizeMultiplier: 4.5,
    fontSizeMultiplierSmall: 1.575,
    viewPortMultiplier: 3.9,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const FB5TextSetting display3 = FB5TextSetting(
    fontSizeMultiplier: 4.0,
    fontSizeMultiplierSmall: 1.525,
    viewPortMultiplier: 3.3,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const FB5TextSetting display4 = FB5TextSetting(
    fontSizeMultiplier: 3.5,
    fontSizeMultiplierSmall: 1.475,
    viewPortMultiplier: 2.7,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const FB5TextSetting display5 = FB5TextSetting(
    fontSizeMultiplier: 3.0,
    fontSizeMultiplierSmall: 1.425,
    viewPortMultiplier: 2.1,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const FB5TextSetting display6 = FB5TextSetting(
    fontSizeMultiplier: 2.5,
    fontSizeMultiplierSmall: 1.375,
    viewPortMultiplier: 1.5,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.2,
    ),
  );
  static const FB5TextSetting lead = FB5TextSetting(
    fontSizeMultiplier: 1.25,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.0,
    ),
  );
  static const FB5TextSetting paragraph = FB5TextSetting(
    fontSizeMultiplier: 1.0,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.0,
    ),
  );
  static const FB5TextSetting small = FB5TextSetting(
    fontSizeMultiplier: 0.875,
    style: TextStyle(
      fontWeight: FontWeight.w300,
      height: 1.0,
    ),
  );
}

class FB5TextSetting {
  final double fontSizeMultiplier;
  final double? fontSizeMultiplierSmall;
  final double? viewPortMultiplier;
  final TextStyle style;

  const FB5TextSetting({
    required this.fontSizeMultiplier,
    this.fontSizeMultiplierSmall,
    this.viewPortMultiplier,
    this.style = const TextStyle(),
  });

  FB5TextSetting copyWidth({
    double? fontSizeMultiplier,
    double? fontSizeMultiplierSmall,
    double? viewPortMultiplier,
    TextStyle? style,
  }) =>
      FB5TextSetting(
        fontSizeMultiplier: fontSizeMultiplier ?? this.fontSizeMultiplier,
        fontSizeMultiplierSmall:
            fontSizeMultiplierSmall ?? this.fontSizeMultiplierSmall,
        viewPortMultiplier: viewPortMultiplier ?? this.viewPortMultiplier,
        style: style ?? this.style,
      );
}

class TextStyles {
  final FB5Typography typography;
  final double fontSize;
  final Size screenSize;
  final BreakPoint breakPoint;
  final BreakPoints breakPoints;

  const TextStyles({
    required this.fontSize,
    required this.screenSize,
    required this.breakPoint,
    required this.breakPoints,
    required this.typography,
  });

  TextStyle get h1 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h1);

  TextStyle get h2 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h2);

  TextStyle get h3 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h3);

  TextStyle get h4 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h4);

  TextStyle get h5 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h5);

  TextStyle get h6 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.h6);

  TextStyle get display1 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display1);

  TextStyle get display2 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display2);

  TextStyle get display3 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display3);

  TextStyle get display4 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display4);

  TextStyle get display5 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display5);

  TextStyle get display6 => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.display6);

  TextStyle get lead => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.lead);

  TextStyle get paragraph => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.paragraph);

  TextStyle get small => typography._getStyle(
      fontSize, screenSize, breakPoint, breakPoints, typography.small);
}

class FB5Typography {
  final FB5TextSetting h1;
  final FB5TextSetting h2;
  final FB5TextSetting h3;
  final FB5TextSetting h4;
  final FB5TextSetting h5;
  final FB5TextSetting h6;

  final FB5TextSetting display1;
  final FB5TextSetting display2;
  final FB5TextSetting display3;
  final FB5TextSetting display4;
  final FB5TextSetting display5;
  final FB5TextSetting display6;

  final FB5TextSetting lead;
  final FB5TextSetting paragraph;
  final FB5TextSetting small;

  const FB5Typography({
    this.h1 = BootstrapTypography.h1,
    this.h2 = BootstrapTypography.h2,
    this.h3 = BootstrapTypography.h3,
    this.h4 = BootstrapTypography.h4,
    this.h5 = BootstrapTypography.h5,
    this.h6 = BootstrapTypography.h6,
    this.display1 = BootstrapTypography.display1,
    this.display2 = BootstrapTypography.display2,
    this.display3 = BootstrapTypography.display3,
    this.display4 = BootstrapTypography.display4,
    this.display5 = BootstrapTypography.display5,
    this.display6 = BootstrapTypography.display6,
    this.lead = BootstrapTypography.lead,
    this.paragraph = BootstrapTypography.paragraph,
    this.small = BootstrapTypography.small,
  });

  TextStyle _getStyle(double fontSize, Size screenSize, BreakPoint breakPoint,
      BreakPoints breakPoints, FB5TextSetting setting) {
    final style = setting.style;

    if (setting.fontSizeMultiplierSmall != null &&
        setting.viewPortMultiplier != null &&
        breakPoint.isBreakPointOrSmaller(breakPoints.lg)) {
      final size = (setting.fontSizeMultiplierSmall! * fontSize) +
          (screenSize.width / 100 * setting.viewPortMultiplier!);
      return style.copyWith(fontSize: size);
    }

    final size = setting.fontSizeMultiplier * fontSize;
    return style.copyWith(fontSize: size);
  }
}
