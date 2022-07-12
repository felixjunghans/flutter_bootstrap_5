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
                  classNames: 'p-xs-4 p-xl-0',
                  children: [
                    FB5Col(
                      classNames: 'col-12',
                      child: Container(
                        color: Colors.blue,
                        width: double.infinity,
                        height: 100.0,
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-lg-8 col-xxl-9',
                      child: Container(
                        color: Colors.green,
                        width: double.infinity,
                        height: 100.0,
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-lg-4 col-xxl-3 mt-md-5',
                      child: Container(
                        color: Colors.yellow,
                        width: double.infinity,
                        height: 100.0,
                        child:  FB5Row(
                          alignment: WrapAlignment.start,
                          classNames: 'row-cols-1 row-cols-sm-2 row-cols-lg-1 g-md-4',
                          children: [
                            FB5Col(
                              classNames: 'order-0 order-sm-1 order-lg-0',
                              child: Container(
                                height: 20.0,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                            ),
                            FB5Col(
                              classNames: 'order-1 order-sm-0 order-lg-1',
                              child: Container(
                                height: 20.0,
                                width: double.infinity,
                                color: Colors.grey,
                              ),
                            ),
                            FB5Col(
                              classNames: 'order-sm-2 order-2',
                              child: Container(
                                height: 20.0,
                                width: double.infinity,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FB5Col(
                      classNames: 'col-12 mt-5',
                      clipBehavior: Clip.none,
                      child: Container(
                        color: Colors.red,
                        width: double.infinity,
                        height: 100.0,
                      ),
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
