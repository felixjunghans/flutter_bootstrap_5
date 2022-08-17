import 'package:example/cubits/app_cubit.dart';
import 'package:example/cubits/app_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Containers extends StatelessWidget {
  const Containers({Key? key}) : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrlString(
        "https://getbootstrap.com/docs/5.2/layout/containers/")) {
      throw 'Could not launch https://getbootstrap.com/docs/5.2/layout/containers/';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FB5Row(
      children: [
        FB5Col(
          classNames: 'col-12',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const H4('Changing Containers'),
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
                        const Text(
                            'Change Container Size. This will affect the behavior of the Container when resizing the browser.'),
                        Container(
                          padding: padding(context, 'p-5'),
                          child: DropdownButton<CurrentContainer?>(
                            items: [
                              const DropdownMenuItem(
                                value: CurrentContainer.defaultContainer,
                                child: Text(
                                  "FB5Container()",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              ...CurrentContainer.values
                                  .where((element) =>
                                      element !=
                                      CurrentContainer.defaultContainer)
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(
                                        "FB5Container.${e.name}()",
                                        style: const TextStyle(
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                            ],
                            value: state.currentContainer,
                            onChanged: (value) {
                              context.read<AppCubit>().currentContainerChanged(
                                  value ?? CurrentContainer.defaultContainer);
                            },
                            icon: null,
                          ),
                        ),
                        TextButton(
                          onPressed: _launchUrl,
                          child: const Text(
                              'You can find more information to Container here https://getbootstrap.com/docs/5.2/layout/containers/'),
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
