import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class CustomNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).appBarTheme.foregroundColor),
        child: FB5Container.lg(
          child: FB5Row(
            classNames: 'align-items-center justify-content-between px-xs-3 px-lg-0',
            children: [
              FB5Col(
                classNames: 'col-6 d-none d-lg-block',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      'Flutter Bootstrap 5',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              FB5Col(
                classNames: 'col-6 d-block d-lg-none align-self-start',
                child: Icon(
                  Icons.menu,
                  color: Theme.of(context).appBarTheme.foregroundColor,
                ),
              ),
              FB5Col(
                classNames: 'col-xs-6 col-lg-3',
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(66.0);
}
