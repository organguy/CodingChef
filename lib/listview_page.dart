import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  var titleList = [
    'Dentist',
    'Pharmacist',
    'School Teacher',
    'IT Manager',
    'Account',
    'Lawyer',
    'Hair Designer',
    'Physician',
    'Web Developer',
    'Medical Secretary'
  ];

  var imageList = [
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

  var descriptions = [
    '1. There are different types of careers you can pusue in your life. Which one will it be?',
    '2. There are different types of careers you can pusue in your life. Which one will it be?',
    '3. There are different types of careers you can pusue in your life. Which one will it be?',
    '4. There are different types of careers you can pusue in your life. Which one will it be?',
    '5. There are different types of careers you can pusue in your life. Which one will it be?',
    '6. There are different types of careers you can pusue in your life. Which one will it be?',
    '7. There are different types of careers you can pusue in your life. Which one will it be?',
    '8. There are different types of careers you can pusue in your life. Which one will it be?',
    '9. There are different types of careers you can pusue in your life. Which one will it be?',
    '10. There are different types of careers you can pusue in your life. Which one will it be?',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ListView Page',
          style: TextStyle(color: Colors.grey),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                debugPrint(titleList[index]);
                showPopup(context, titleList[index], imageList[index],
                    descriptions[index]);
              },
              child: Card(
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.asset(imageList[index]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text(
                            titleList[index],
                            style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width: width,
                            child: Text(
                              descriptions[index],
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[500]),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }

  void showPopup(context, title, image, description) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        image,
                        width: 200,
                        height: 200,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        description,
                        maxLines: 3,
                        style: TextStyle(fontSize: 15, color: Colors.grey[500]),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                        label: const Text('close'))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
