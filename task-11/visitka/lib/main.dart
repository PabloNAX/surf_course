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
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/images/info.svg'),
                  title: const Text('О себе'),
                  subtitle:
                      const Text('Здесь вы можете написать что-то о себе.'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: SvgPicture.asset('assets/images/hobby.svg'),
                  title: const Text('Увлечения'),
                  subtitle: const Text(
                    'Example of happy sans font',
                    style: TextStyle(fontFamily: 'HappySans', fontSize: 24),
                  ),
                ),
              ),
              const Card(
                child: ListTile(
                  leading: Icon(Icons.sentiment_very_satisfied),
                  title: Text('Опыт в разработке'),
                  subtitle: Text(
                      'Здесь вы можете написать о своем опыте в разработке.'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
