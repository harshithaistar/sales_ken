import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(
          "Talentify",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: getLoginScreen(),
    );
  }

  Widget getLoginScreen() {
    return Center(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        children: <Widget>[
          SizedBox(height: 40.0, width: 40.0),
          Column(
            children: <Widget>[
              Image.asset(
                'assets/logo.png',
                height: 30,
                width: 30,
              ),
              SizedBox(height: 50.0),
              Text(
                'Welcome',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(labelText: 'username', filled: true),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: InputDecoration(labelText: 'password', filled: true),
          ),
          new InkWell(
            onTap: () => print('hello'),
            child: new Container(
              margin: EdgeInsets.all(20.0),
              height: 50.0,
              decoration: new BoxDecoration(
                color: Colors.redAccent,
                border: new Border.all(color: Colors.white, width: 1.0),
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: new Center(
                child: new Text(
                  'Login',
                  style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Center(
            child: new Text('iStar Skill Development'),
          )
        ],
      ),
    );
  }
}
