import 'package:flutter/material.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  int? _studentID;
  int? _age;
  String? _gender;
  String? _isSmoking;

  final _formKey = GlobalKey<FormState>();

  void _informationView() {
    String info =
        '학번: ${_studentID ?? '선택 안됨'}\n'
        '나이: ${_age ?? '선택 안됨'}\n'
        '성별: ${_gender ?? '선택 안됨'}\n'
        '흡연 여부: ${_isSmoking ?? '선택 안됨'}';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('정보'),
          content: Text(info),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('닫기'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('정보'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  labelText: '학번',
                  border: OutlineInputBorder(),
                ),
                value: _studentID,
                onChanged: (int? newValue) {
                  setState(() {
                    _studentID = newValue;
                  });
                },
                items: <int>[23, 22, 21, 20, 19, 18, 17, 16, 15]
                    .map<DropdownMenuItem<int>>((int value) {
                  return DropdownMenuItem<int>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return '학번을 선택하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: '나이',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '나이를 입력하세요';
                  }
                  if (int.tryParse(value) == null) {
                    return '숫자를 입력하세요';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    _age = int.tryParse(value!);
                  });
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: '성별',
                  border: OutlineInputBorder(),
                ),
                value: _gender,
                onChanged: (String? newValue) {
                  setState(() {
                    _gender = newValue;
                  });
                },
                items: <String>['남자', '여자']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return '성별을 선택하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: '흡연 여부',
                  border: OutlineInputBorder(),
                ),
                value: _isSmoking,
                onChanged: (String? newValue) {
                  setState(() {
                    _isSmoking = newValue;
                  });
                },
                items: <String>['흡연', '비흡연']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null) {
                    return '흡연 여부를 선택하세요';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _informationView();
                  }
                },
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

