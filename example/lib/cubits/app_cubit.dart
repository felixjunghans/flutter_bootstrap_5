

import 'package:example/cubits/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  void defaultFontSizeChanged(double fontSize) {
    emit(state.copyWidth(defaultFontSize: fontSize));
  }

  void currentContainerChanged(CurrentContainer currentContainer) {
    emit(state.copyWidth(currentContainer: currentContainer));
  }
}
