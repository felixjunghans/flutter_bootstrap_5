import 'package:equatable/equatable.dart';

enum CurrentContainer {
  defaultContainer,
  sm,
  md,
  lg,
  xl,
  xxl,
  fluid,
}

class AppState extends Equatable {
  final double defaultFontSize;
  final CurrentContainer currentContainer;

  const AppState({
    this.defaultFontSize = 16.0,
    this.currentContainer = CurrentContainer.defaultContainer,
  });

  @override
  List<Object?> get props => [
        defaultFontSize,
        currentContainer,
      ];

  AppState copyWidth({
    double? defaultFontSize,
    CurrentContainer? currentContainer,
  }) =>
      AppState(
        defaultFontSize: defaultFontSize ?? this.defaultFontSize,
        currentContainer: currentContainer ?? this.currentContainer,
      );
}
