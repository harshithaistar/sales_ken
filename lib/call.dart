import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  CallPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  String dropdownValue = '1X';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: getCallScreenAppBar(),
      ),
      body: getCallScreenBody(),
    );
  }

  Widget getCallScreenBody() {
    print(MediaQuery.of(context).size.height);
    var tabbedView = SizedBox(
      height: MediaQuery.of(context).size.height * 0.55,
      width: MediaQuery.of(context).size.width,
    );
    var commentView = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: 'Comment here...'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.near_me),
          onPressed: () {},
        )
      ],
    );
    var controlSectionGraph = SizedBox(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width,
    );
    var controlSectionButtons = Column(
      children: <Widget>[
        Text('Jennifer Jones'),
        Row(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>['1X', '2X', '3X', '4X']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            IconButton(
              icon: Icon(Icons.replay_10),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.play_arrow),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.forward_10),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              onPressed: () {},
            )
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        )
      ],
    );

    return Column(
      children: <Widget>[
        tabbedView,
        commentView,
        controlSectionGraph,
        controlSectionButtons
      ],
    );
  }

  Widget getCallScreenAppBar() {
    var centerPiece = Column(
      children: <Widget>[
        Text('Stark Industries | Gong.io'),
        Text(
          'JUN 8, 2017',
          style: TextStyle(fontSize: 12),
        )
      ],
    );
    var rightPiece = IconButton(
      icon: Icon(Icons.cloud_download),
      onPressed: () {
        print('Download icon pressed');
      },
    );
    var appBar = Row(
        children: <Widget>[centerPiece, rightPiece],
        mainAxisAlignment: MainAxisAlignment.center);
    return appBar;
  }
}
