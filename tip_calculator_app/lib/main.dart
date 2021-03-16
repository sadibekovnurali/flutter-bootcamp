import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _controller = TextEditingController();
  List<bool> _selection = [true, false, false];

  String tip;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Total amount'),
              SizedBox(height: 20),
              SizedBox(
                height: 70,
                width: 70,
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(hintText: '\$100'),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: ToggleButtons(
                  children: [
                    Text('25%'),
                    Text('50%'),
                    Text('75%'),
                  ],
                  isSelected: _selection,
                  onPressed: _updateSelection,
                ),
              ),
              MaterialButton(
                onPressed: () {
                  _calculateTip();
                },
                color: Colors.green,
                child: Text('Calculate!'),
                textColor: Colors.white,
              ),
              if (tip != null) Text(tip),
            ],
          ),
        ),
      ),
    );
  }

  void _updateSelection(int selectedIndex) {
    setState(() {
      for (int i = 0; i < _selection.length; ++i) {
        _selection[i] = selectedIndex == i;
      }
    });
  }

  void _calculateTip() {
    final totalAmount = double.parse(_controller.text);
    final selectedIndex = _selection.indexWhere((element) => element);
    final tipPercentage = [0.25, 0.5, 0.75][selectedIndex];

    final tipTotal = (totalAmount * tipPercentage).toStringAsFixed(2);

    setState(() {
      tip = '\$$tipTotal';
    });
  }
}
