import 'package:coding_chef/listview_person_detail.dart';
import 'package:coding_chef/models/person.dart';
import 'package:flutter/material.dart';

class ListViewPerson extends StatefulWidget {
  const ListViewPerson({Key? key}) : super(key: key);

  @override
  State<ListViewPerson> createState() => _ListViewPersonState();
}

class _ListViewPersonState extends State<ListViewPerson> {
  static List<String> personNames = [
    'Jack',
    'Mary',
    'Jane',
    'Tom',
    'Judy',
    'John',
    'Micheal',
    'Kane',
    'Simon',
    'Philip'
  ];

  static List<String> personImagePath = [
    'assets/face01.jpg',
    'assets/face02.jpg',
    'assets/face03.jpg',
    'assets/face04.jpg',
    'assets/face05.jpg',
    'assets/face06.jpg',
    'assets/face07.jpg',
    'assets/face08.jpg',
    'assets/face09.jpg',
    'assets/face10.jpg'
  ];

  static List<String> personLocations = [
    'Korea',
    'USA',
    'Japan',
    'China',
    'France',
    'India',
    'England',
    'Italy',
    'Spain',
    'Germany'
  ];

  final List<Person> personData = List.generate(
      personLocations.length,
      (index) => Person(
          personNames[index], personLocations[index], personImagePath[index]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: ListView.builder(
          itemCount: personData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(personData[index].name),
                leading: SizedBox(
                  width: 50,
                  height: 50,
                  child: Image.asset(personData[index].imgPath),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ListPersonDetailPage(person: personData[index])));
                  debugPrint(personData[index].name);
                },
              ),
            );
          }),
    );
  }
}
