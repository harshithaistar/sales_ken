import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  final String title;
  Login({Key key, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
        TextField(
          decoration: InputDecoration(labelText: 'username', filled: true),
        ),
        SizedBox(height: 20.0),
        TextField(
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
                style: new TextStyle(fontSize: 18.0, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
