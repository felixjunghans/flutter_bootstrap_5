import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bootstrap5/flutter_bootstrap5.dart';

class TestingArea extends StatefulWidget {
  const TestingArea({Key? key}) : super(key: key);

  @override
  State<TestingArea> createState() => _TestingAreaState();
}

class _TestingAreaState extends State<TestingArea> {
  late final TextEditingController _rowController;
  late List<_ColValue> cols;

  @override
  void initState() {
    _rowController = TextEditingController();
    cols = List.generate(4, (index) => _generateCol());
    super.initState();
  }

  _ColValue _generateCol() {
    const className = 'col-6';
    final color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    return _ColValue(TextEditingController(text: className), color);
  }

  void _addCol() {
    setState(() {
      cols = [...cols, _generateCol()];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const H4('Play with Row and Cols'),
        const SizedBox(
          height: 16.0,
        ),
        Text(
          'You can change the classes of the cols by clicking on the text, changing it and confirming with Enter.',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 16.0,
        ),
        CupertinoTextField(
          controller: _rowController,
          placeholder: 'Change row classNames...',
          onEditingComplete: () {
            setState(() {});
          },
        ),
        const SizedBox(
          height: 16.0,
        ),
        CupertinoButton.filled(
            onPressed: _addCol, child: const Text('Add Col')),
        const SizedBox(
          height: 16.0,
        ),
        Container(
          decoration: BoxDecoration(
            border: borderDark(context, opacity: 0.1),
            color: BootstrapTheme.of(context).colors.light,
          ),
          child: FB5Row(
            classNames: _rowController.text,
            children: [
              ...cols.map(
                (col) => FB5Col(
                  classNames: col.controller.text,
                  child: Container(
                    constraints: const BoxConstraints(
                      minHeight: 50.0,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: col.color,
                    ),
                    child: CupertinoTextField.borderless(
                      controller: col.controller,
                      onEditingComplete: () {
                        setState(() {});
                      },
                      style: TextStyle(
                        color: BootstrapTheme.of(context).colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ColValue {
  final TextEditingController controller;
  final Color color;

  _ColValue(this.controller, this.color);
}
