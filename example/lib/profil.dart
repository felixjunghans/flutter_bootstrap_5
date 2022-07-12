import 'package:example/widgets/side_bar.dart';
import 'package:example/widgets/timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: FB5Container(
          child: Container(
            child: Column(
              children: [
                FB5Row(
                  classNames: 'g-4 mt-4',
                  children: [
                    FB5Col(
                      classNames: 'col-lg-8',
                      child: const Timeline(),
                    ),
                    FB5Col(
                      classNames: 'col-lg-4',
                      child: const SideBar(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
