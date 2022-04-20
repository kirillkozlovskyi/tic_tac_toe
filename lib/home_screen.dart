import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'alert_dialog.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
  bool _turnOfO = true;
  int _filledBoxes = 0;
  final List<String> _xOrOList = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              _clearBord();
            },
          )
        ],
        title: const Text('Tic Tac Toe',
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w800),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          _buildPointTable(),
          _buildGrid(),
          _buildTurn(),

        ],
      ),
    );
  }

  Widget _buildPointTable() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Player O', style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
                ),
               const SizedBox(height: 20),
                Text(
                  _scoreO.toString(),
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Player X', style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
                ),
                const SizedBox(height: 20),
                Text(
                  _scoreX.toString(),
                  style: const TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildGrid() {
    return Expanded(
      flex: 3,
      child: Padding (
        padding: const EdgeInsets.only(left: 15, right: 15),
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _tapped(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      _xOrOList[index], style: TextStyle(
                        fontSize: 40,
                        color:
                         _xOrOList[index] == 'x' ? Colors.white : Colors.red,
                        fontWeight: FontWeight.w400 ),
                    ),
                  ),
                ),
              );
            },
          )
      )

    );
  }

  Widget _buildTurn () {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Text(
            _turnOfO ? 'Turn of O' : 'Turn of X',
            style: const TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
  _clearBord() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        _xOrOList[i] = '';
      }
    });
    _filledBoxes = 0;
  }
  _tapped (int index) {
    setState(() {
      if( _xOrOList[index] == '') {
        _xOrOList[index] = _turnOfO ? 'o' : 'x';
        _turnOfO = !_turnOfO;
        _filledBoxes += 1;
      }
      _checkTheWinner();
    });
  }
  _checkTheWinner(){
    // first row
    if(_xOrOList[0] == _xOrOList[1] && _xOrOList[0] == _xOrOList[2] && _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }
    // second row
    if(_xOrOList[3] == _xOrOList[4] && _xOrOList[3] == _xOrOList[5] && _xOrOList[3] != '') {
      _showAlertDialog('Winner', _xOrOList[3]);
      return;
    }
    // third row
    if(_xOrOList[6] == _xOrOList[7] && _xOrOList[6] == _xOrOList[8] && _xOrOList[6] != '') {
      _showAlertDialog('Winner', _xOrOList[6]);
      return;
    }
    // first column
    if(_xOrOList[0] == _xOrOList[3] && _xOrOList[0] == _xOrOList[6] && _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }
    // second column
    if(_xOrOList[1] == _xOrOList[4] && _xOrOList[1] == _xOrOList[7] && _xOrOList[4] != '') {
      _showAlertDialog('Winner', _xOrOList[1]);
      return;
    }
    // second column
    if(_xOrOList[2] == _xOrOList[5] && _xOrOList[2] == _xOrOList[8] && _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }
    // first diagonal
    if(_xOrOList[0] == _xOrOList[4] && _xOrOList[0] == _xOrOList[8] && _xOrOList[0] != '') {
      _showAlertDialog('Winner', _xOrOList[0]);
      return;
    }
    // second diagonal
    if(_xOrOList[4] == _xOrOList[4] && _xOrOList[4] == _xOrOList[6] && _xOrOList[2] != '') {
      _showAlertDialog('Winner', _xOrOList[2]);
      return;
    }
    if(_filledBoxes == 9) {
      _showAlertDialog('Draw', '');
    }
  }

  void _showAlertDialog(String title, String winner){
    showAlertDialog(
      title: title,
      context: context,
      content: winner == ''
          ? 'The match ended in a draw'
          : 'The winner is ${winner.toUpperCase()}',
      defaultActionText: 'OK',
      onOkPressed: () {
        _clearBord();
        Navigator.of(context).pop();
      }
    );
    if (winner == 'o') {
      _scoreO += 1;
    } else if (winner == 'x') {
      _scoreX += 1;
    }
  }
}
