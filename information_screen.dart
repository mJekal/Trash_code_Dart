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
  final List<String> _informationList = [];

  bool _isFormVisible = false;

  void _informationView() {
    String info = '학번: ${_studentID ?? '선택 안됨'}\n'
        '나이: ${_age ?? '선택 안됨'}\n'
        '성별: ${_gender ?? '선택 안됨'}\n'
        '흡연 여부: ${_isSmoking ?? '선택 안됨'}';

    setState(() {
      _informationList.add(info);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('정보'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: _isFormVisible,
              child: Form(
                key: _formKey,
                child: Column(
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
                      items: <DropdownMenuItem<int>>[
                        for (int value in [23, 22, 21, 20, 19, 18, 17, 16, 15])
                          DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          ),
                      ],
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
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: '남자',
                          child: Text('남자'),
                        ),
                        DropdownMenuItem<String>(
                          value: '여자',
                          child: Text('여자'),
                        ),
                      ],
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
                      items: <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: '흡연',
                          child: Text('흡연'),
                        ),
                        DropdownMenuItem<String>(
                          value: '비흡연',
                          child: Text('비흡연'),
                        ),
                      ],
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
            Expanded(
              child: ListView.builder(
                itemCount: _informationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_informationList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _isFormVisible = !_isFormVisible;
          });
        },
        child: Icon(_isFormVisible ? Icons.remove : Icons.add),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: InformationScreen(),
  ));
}
