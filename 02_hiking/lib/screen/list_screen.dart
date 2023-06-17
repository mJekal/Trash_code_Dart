import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/decription.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
        appBar: AppBar(
          title: Text('등산 기록',),
          backgroundColor: Color.fromARGB(255, 255, 0, 85),
          leading:Icon(Icons.hiking),
          ),
        
        body: Container(
          padding: EdgeInsets.only(top: 10),
          child: ListView (
            children: <Widget>[
              Mountains(
                mountName : '팔공산',
                mountAddress: '경북 경산시 와촌면 갓바위로 681-55',
                mountImage: 'images/팔공산.png',
                mountcourse: '주차장-등산안내소-관음사-용주암-보은사-관봉-돌계단-갓바위',
                date: '2022.10.10',
              ),
              Mountains(
                mountName : '남산',
                mountAddress: '경북 청도군 각남면 사리 산54',
                mountImage: 'images/남산.png',
                mountcourse: '다람지고개-한재고개-삼면봉',
                date: '2020.5.2',
              ),
              Mountains(
                mountName : '대니산',
                mountAddress: '대구 달성군 구지면 화산리',
                mountImage: 'images/대니산.png',
                mountcourse: '주차장-관기봉-금수암-조화봉-대견사',
                date: '2020.4.26',
              ),
              Mountains(
                mountName : '비슬산',
                mountAddress: '대구 달성군 유가읍 양리 산1',
                mountImage: 'images/비슬산.png',
                mountcourse: '유가사-수도암-도통바위-정상',
                date: '2023.4.8',
              ),
              Mountains(
                mountName : '주왕산',
                mountAddress: '경북 청송군 주왕산면 공원길 169-7',
                mountImage: 'images/주왕산.png',
                mountcourse: '국립공원 주차장 - 대전사 - 지하교 쉼터 - 용추 폭포',
                date: '2022.10.30',
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(),
    );
  }
}   


class Mountains extends StatelessWidget {
  String mountName;
  String mountAddress;
  String mountcourse;
  String date;
  String mountImage;
  Mountains({
    required this.mountName,
    required this.mountAddress,
    required this.mountcourse,
    required this.date,
    required this.mountImage,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(mountName),
      subtitle: Text(mountAddress),
      leading: Image.asset(mountImage,height:250,width: 80,),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DescriptionScreen(
            mountName: mountName,
            mountAddress: mountAddress,
            mountImage: mountImage,
            date: date,
            mountcourse: mountcourse,
          ),),
        );
      },
    );
  }
}