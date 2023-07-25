import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      var contacts = await ContactsService.getContacts();
      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      Permission.contacts.request();
    }
  }

  int total = 0;
  List<Contact> name = [];

  totalplus() {
    setState(() {
      total++;
    });
  }

  nameplus(k) {
    setState(() {
      name.add(k);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                getPermission();
              },
              icon: Icon(Icons.contacts))
        ],
        title: Text('연락처 목록 : ' + total.toString()),
      ),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(name[i].givenName ?? '이름 없음'),
          );
        },
      ),
      bottomNavigationBar: Bottom(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogUI(
                    function: totalplus, name: name, nameplus: nameplus);
              });
        },
      ),
    );
  }
}
class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.phone),
            Icon(Icons.message),
            Icon(Icons.contact_phone_rounded),
          ],
        ),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.function, this.name, this.nameplus})
      : super(key: key);
  final function;
  final name;
  final nameplus;

  var inputData = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        width: 300,
        height: 300,
        child: Column(
          children: [
            TextField(
              controller: inputData,
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    function();
                    var newContact = Contact();
                    newContact.givenName = inputData.text;
                    ContactsService.addContact(newContact);
                    nameplus(inputData.text);
                    Navigator.pop(context);
                  },
                  child: Text('완료'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('취소'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

