import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    );
  }
}
