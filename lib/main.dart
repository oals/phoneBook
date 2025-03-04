import 'package:flutter/material.dart';
import 'package:phonebook/screens/phoneBookScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  int _currentIndex = 0;
  final List<Widget> pageWidgets = [
    Phonebooklist(),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: pageWidgets[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex : index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.format_list_bulleted_outlined,color: Colors.blueAccent,),
              label: '연락처',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.call,color: Colors.white,),
              label: '전화'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: Colors.white,),
              label: '관리'
          ),
        ],
        selectedItemColor: Colors.blueAccent
      ),
    );
  }
}
