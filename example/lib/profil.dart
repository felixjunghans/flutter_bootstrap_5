import 'package:example/cubits/app_cubit.dart';
import 'package:example/cubits/app_state.dart';
import 'package:example/widgets/containers.dart';
import 'package:example/widgets/getting_started.dart';
import 'package:example/widgets/grid_area.dart';
import 'package:example/widgets/navigation_bar.dart';
import 'package:example/widgets/testing_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _wrapper(AppState state, {required Widget child}) {
      switch (state.currentContainer) {
        case CurrentContainer.defaultContainer:
          return FB5Container(
            child: child,
          );
        case CurrentContainer.sm:
          return FB5Container.sm(
            child: child,
          );
        case CurrentContainer.md:
          return FB5Container.md(
            child: child,
          );
        case CurrentContainer.lg:
          return FB5Container.lg(
            child: child,
          );
        case CurrentContainer.xl:
          return FB5Container.xl(
            child: child,
          );
        case CurrentContainer.xxl:
          return FB5Container.xxl(
            child: child,
          );
        case CurrentContainer.fluid:
          return FB5Container.fluid(
            child: child,
          );
      }
    }

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomNavigationBar(),
          body: SingleChildScrollView(
            child: _wrapper(
              state,
              child: FB5Row(
                classNames: 'mt-5 px-xs-3 px-lg-0 gx-4',
                children: [
                  FB5Col(
                    classNames: 'col-12',
                    child: const GettingStarted(),
                  ),
                  FB5Col(
                    classNames: 'col-12 mt-5',
                    child: const Containers(),
                  ),

                  FB5Col(
                    classNames: 'mt-5',
                    child: const TestingArea(),
                  ),
                  FB5Col(
                    classNames: 'my-5',
                    child: const GridArea(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
