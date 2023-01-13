import 'dart:convert';

import 'package:azlistview/azlistview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'employee_details_screen.dart';

class EmployeeListScreen extends StatefulWidget {
  const EmployeeListScreen({super.key});

  @override
  State<EmployeeListScreen> createState() => _EmployeeListScreenState();
}

class _EmployeeListScreenState extends State<EmployeeListScreen> {
  List<Model> list = [];

  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    final data = await DefaultAssetBundle.of(context)
        .loadString('assets/loadjson/details.json');
    var newData = json.decode(data.toString());
    for (var i = 0; i < newData.length; i++) {
      list.add(Model(
          name: newData[i]['firstName'],
          lastName: newData[i]['lastName'],
          img: newData[i]['imageUrl'],
          email: newData[i]['email'],
          contactNum: newData[i]['contactNumber'],
          age: newData[i]['age'],
          dob: newData[i]['dob'],
          salary: newData[i]['salary'],
          address: newData[i]['address'],
          tagIndex: newData[i]['firstName'].toString().substring(0, 1)));
    }

    list.sort((a, b) {
      return a.name!.toLowerCase().compareTo(b.name!.toLowerCase());
    });
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Employee List'),
        ),
        body: Center(
            child: AzListView(
                data: list,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EmployeeDetailsScreen(empList: list[index]),
                        ),
                      );
                    },
                    child: ListTile(
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: (list[index].img!.isNotEmpty)
                              ? Image.network(
                                  list[index].img!.toString(),
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.fill,
                                )
                              : Image.asset("assets/images/person.png"),
                        ),
                        title: Row(
                          children: <Widget>[
                            Text(list[index].name!),
                            const SizedBox(width: 5),
                            Text(list[index].lastName!),
                          ],
                        )),
                  );
                })));
  }
}

class Model extends ISuspensionBean {
  final String? name;
  final String? tagIndex;
  final String? lastName;
  final String? img;
  final String? email;
  final String? contactNum;
  final int? age;
  final String? dob;
  final int? salary;
  final String? address;
  Model(
      {this.name,
      this.tagIndex,
      this.lastName,
      this.img,
      this.email,
      this.contactNum,
      this.age,
      this.dob,
      this.salary,
      this.address});

  @override
  String getSuspensionTag() => tagIndex!;
}
