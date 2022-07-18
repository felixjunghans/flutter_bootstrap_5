import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FB5Row(
      children: [
        FB5Col(
          classNames: 'col-12',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              H6(
                'Getting Started',
                style: TextStyle(fontWeight: FontWeight.w700),
              ),
              Text('Introduction'),
            ],
          ),
        ),
      ],
    );
  }
}
