import 'package:example/cubits/app_cubit.dart';
import 'package:example/cubits/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class GettingStarted extends StatelessWidget {
  const GettingStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FB5Row(
      children: [
        FB5Col(
          classNames: 'col-12',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const H1(
                'Flutter Bootstrap 5 Playground',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const H4('Customize automatic font sizing'),
              Container(
                decoration: BoxDecoration(
                  borderRadius: rounded(context),
                  border: borderDark(context, opacity: 0.1),
                ),
                margin: margin(context, 'my-4'),
                padding: padding(context, 'p-3'),
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                            'Change default font size (${state.defaultFontSize}px)'),
                        Container(
                          padding: padding(context, 'p-5'),
                          child: CupertinoSlider(
                            value: state.defaultFontSize,
                            min: 12.0,
                            max: 20.0,
                            divisions: 8,
                            onChanged: (value) => context
                                .read<AppCubit>()
                                .defaultFontSizeChanged(value),
                          ),
                        ),
                        Text(
                          'Notice. Changing the font size also affects all other relative values (e.g. margin and padding), as these are calculated in "rem". For example, the top slider has a padding of p-5, which means that it should use 5 times the default font size as padding.',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
