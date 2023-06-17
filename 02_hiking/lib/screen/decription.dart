import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  String mountName;
  String mountAddress;
  String mountcourse;
  String date;
  String mountImage;
  DescriptionScreen({
    required this.mountName,
    required this.mountAddress,
    required this.mountcourse,
    required this.date,
    required this.mountImage,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(mountName),
          backgroundColor: Color.fromARGB(255, 255, 0, 85),
          ),
        body: Container(
          child: Center(
            child: Column(children: [
              Image.asset(mountImage, width: 500,height: 500,),
              Text(date),
              Text(mountcourse),
            ]),
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
    );
  }
}