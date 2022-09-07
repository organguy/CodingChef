import 'package:flutter/material.dart';

class AppbarPage extends StatelessWidget {
  const AppbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AppBar Page'),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.deepOrange,
        actions: [
          IconButton(
              onPressed: () => print('shopping button clicked'),
              icon: const Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () => print('search button clicked'),
              icon: const Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: const Text('BBANTO'),
                accountEmail: const Text('bbanto@gmail.com'),
                currentAccountPicture: const CircleAvatar(
                  backgroundImage: AssetImage('assets/icon.png'),
                  backgroundColor: Colors.white,
                ),
                otherAccountsPictures: const [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icon.png'),
                    backgroundColor: Colors.white,
                  )
                ],
                onDetailsPressed: () => print('arrow is clicked'),
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                  )
                ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.grey[850],),
              title: const Text('Home'),
              trailing: const Icon(Icons.add),
              onTap: (){
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[850],),
              title: const Text('Settings'),
              trailing: const Icon(Icons.add),
              onTap: (){
                print('Settings is clicked');
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.grey[850],),
              title: const Text('Q&A'),
              trailing: const Icon(Icons.add),
              onTap: (){
                print('Q&A is clicked');
              },
            )
          ],
        ),
      ),
    );
  }
}
