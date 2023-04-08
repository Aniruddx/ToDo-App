import 'package:flutter/material.dart';

class progress extends StatefulWidget {
  @override
  State<progress> createState() => _progressState();
}

class _progressState extends State<progress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Progress',
          ),
          titleTextStyle: TextStyle(
            letterSpacing: 2,
            color: Colors.white70
          ),
        centerTitle: true,
        
      ),
    );
    }
    }