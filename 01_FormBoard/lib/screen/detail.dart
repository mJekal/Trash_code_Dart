import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String data;

  Detail({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('세부사항'),
      ),
      body: Center(
        child: Text(data),
      ),
    );
  }
}
