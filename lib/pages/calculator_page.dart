import 'package:flutter/material.dart';
import '../controllers/calculator_controller.dart';
import 'package:share/share.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}



class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  String _commandDysplay2 = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: [
          _buildDisplay2(text: _commandDysplay2),
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Calculadora', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.black,
      actions: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: ()=> share(),
        )
      ],
    );
  }
  void share() {
    Share.share('https://github.com/GiancarloLeardini');
  }

  Widget _buildDisplay2({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
         text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.grey,
            fontFamily:'calculator',
            fontSize: 35,
          ), 
        )
      ),
    );

  }

  _display2Logic(String label) {
    final length = _commandDysplay2.length;
    if (label == 'AC') {
      _commandDysplay2 = '';
    } else if (label == 'DEL') {
      if (length > 1) {
        _commandDysplay2 = _commandDysplay2.substring(0, length - 1);
      } else {
        _commandDysplay2 = '';
      }
      }else if (label == '='){
        _commandDysplay2 += label + _controller.result;

      }else{
        _commandDysplay2 += label;
      }
  }



  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Colors.white,
            fontFamily:'calculator',
            fontSize: 60,
            ),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.black,
      height: height * 0.65 > 600.0 ? 500 : height * 0.65,
      child: Column(
        children: [
          _buildKeyboardLine1(),
          _buildKeyboardLine2(),
          _buildKeyboardLine3(),
          _buildKeyboardLine4(),
          _buildKeyboardLine5(),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: 'AC', color: Colors.deepPurple),
          _buildButton(label: 'DEL', color: Colors.deepPurple),
          _buildButton(label: '%', color: Colors.deepPurple),
          _buildButton(label: '/', color: Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '7'),
          _buildButton(label: '8'),
          _buildButton(label: '9'),
          _buildButton(label: 'x', color: Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '4'),
          _buildButton(label: '5'),
          _buildButton(label: '6'),
          _buildButton(label: '-', color: Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine4() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '1'),
          _buildButton(label: '2'),
          _buildButton(label: '3'),
          _buildButton(label: '+', color: Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine5() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '0', flex: 2),
          _buildButton(label: ','),
          _buildButton(label: '=', color: Colors.deepPurple),
        ],
      ),
    );
  }

  Widget _buildButton({
    String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: color,
          ),
        ),
        color: Colors.black,
        onPressed: (){
          setState((){ 
            _calculatorLogic(label);
            _display2Logic(label);
             });
          }),
    );
  }

  _calculatorLogic(String label) {
      _controller.applyCommand(label);
    }
}