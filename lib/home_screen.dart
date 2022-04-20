import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _scoreX = 0;
  int _scoreO = 0;
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
              // _clearBord()
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
          // _buildGrid(),
          // _buildTurn(),

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
}
