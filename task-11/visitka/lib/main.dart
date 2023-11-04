import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Business Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'My Business Card'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 94,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/my_photo.JPG'),
                    radius: 50.0,
                  ),
                ),
                const Text(
                  'Павел Калошин',
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                Card(
                  child: ListTile(
                    leading: SvgPicture.asset('assets/images/info.svg'),
                    title: const Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'О себе',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    subtitle:
                        const Text('Нравится решать сложные задачи и челенджи'),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.play_circle,
                      color: Colors.black,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Увлечения',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    subtitle: Text(
                      'Reading, Surfing, Marshal arts, Personal devepment',
                      style: TextStyle(fontFamily: 'HappySans', fontSize: 24),
                    ),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.laptop,
                      color: Colors.black,
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        'Опыт в разработке',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    subtitle: Text(
                        'В основном Web Разработка, python, js, php. Перехожу в мобильный мир'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
