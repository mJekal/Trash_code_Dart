import 'package:flutter/material.dart';
import 'dart:async';

class TimerStart extends StatefulWidget {
  @override
  State<TimerStart> createState() => _TimerState();
}

class _TimerState extends State<TimerStart> {
  int _cnt = 60;
  late Timer _timer;

  void TimerStart() {
    _cnt = 60;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_cnt > 0){
        setState(() {
          _cnt --;
        });
        } else{
          _timer.cancel();
        }
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100,),
                Text('$_cnt',style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 80,
                  color: Colors.blue,
                ),
              ),
                const SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ElevatedButton(onPressed: () {
                    TimerStart();
                  }, child: Text('START')),
                  SizedBox(width: 30,),
                  ElevatedButton(onPressed: () {
                    _timer.cancel();
                  }, child: Text('STOP')),
                  SizedBox(width: 30,),
                  ElevatedButton(onPressed: () {
                    setState(() {
                      _timer.cancel();
                      _cnt = 60;
                });
              }, child: Text('RESET')),
            ],)
          ],
        ),
      ),
    );
  }
}