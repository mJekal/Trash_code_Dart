import 'package:flutter/material.dart';
import 'package:code_for_hackathon/screen/detail.dart';

class InformationScreen extends StatefulWidget {
  @override
  _InformationScreenState createState() => _InformationScreenState();
}

class _InformationScreenState extends State<InformationScreen> {
  List<String> _informationList = [];

  void _informationView(int? studentID, int? age, String? gender,
      String? isSmoking) {
    String info = '학번: ${studentID ?? '선택 안됨'}\n'
        '나이: ${age ?? '선택 안됨'}\n'
        '성별: ${gender ?? '선택 안됨'}\n'
        '흡연 여부: ${isSmoking ?? '선택 안됨'}';

    setState(() {
      _informationList.add(info);
    });
  }

  void _navigateToForm() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InformationForm(),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      _informationView(
        result['studentID'],
        result['age'],
        result['gender'],
        result['isSmoking'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기숙사 룸메이트'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToForm,
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemCount: _informationList.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_informationList[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(data: _informationList[index]),
                ),
              );
            },

          );
        },
      ),
    );
  }
}

class InformationForm extends StatefulWidget {
  @override
  _InformationFormState createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  final _formKey = GlobalKey<FormState>();
  int? _studentID;
  int? _age;
  String? _gender;
  String? _isSmoking;

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(
        context,
        {
          'studentID': _studentID,
          'age': _age,
          'gender': _gender,
          'isSmoking': _isSmoking,
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('기숙사 룸메이트'),
      ),
      body: SingleChildScrollView(
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
                items: [
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
                items: [
                  DropdownMenuItem<String>(
                    child: Text('남자'),
                    value: '남자',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('여자'),
                    value: '여자',
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
                items: [
                  DropdownMenuItem<String>(
                    child: Text('흡연'),
                    value: '흡연',
                  ),
                  DropdownMenuItem<String>(
                    child: Text('비흡연'),
                    value: '비흡연',
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
                onPressed: _saveForm,
                child: Text('저장'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}