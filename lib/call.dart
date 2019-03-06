import 'package:flutter/material.dart';

class CallPage extends StatefulWidget {
  CallPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  String dropdownValue = '1X';
  //TabController tabController;
  @override
  void initState() {
    super.initState();
    _controller = new TabController(length: 2, vsync: this);
  }

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
    var tabbedView = getTimelineTranscriptionCommentBlock();
    var commentView = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: ' Comment here...'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.near_me, color: Colors.red[500]),
          onPressed: () {},
        )
      ],
    );
    var controlSectionGraph = SizedBox(
      height: MediaQuery.of(context).size.height * 0.10,
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
      padding: const EdgeInsets.only(right: 50.0),
      onPressed: () {
        print('Download icon pressed');
      },
    );

    var appBar = Row(
        children: <Widget>[centerPiece, rightPiece],
        mainAxisAlignment: MainAxisAlignment.center);
    return appBar;
  }

  Widget getTimeLineView() {
    return Text('This is my transcriptionView');
  }

  Widget getTranscriptionView() {
    return Text('This is my getTranscriptionView');
  }

  Widget getCommentView() {
    return Text('This is my getCommentView');
  }

  Widget getTimelineTranscriptionCommentBlock() {
    var controlGraphView = SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
    );
    var tabbedView = ListView(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(color: Theme.of(context).primaryColor),
          child: new TabBar(
            controller: _controller,
            tabs: [
              new Tab(
                icon: const Icon(Icons.home),
                text: 'Address',
              ),
              new Tab(
                icon: const Icon(Icons.my_location),
                text: 'Location',
              ),
            ],
          ),
        ),
        new Container(
          height: 80.0,
          child: new TabBarView(
            controller: _controller,
            children: <Widget>[
              new Card(
                child: new ListTile(
                  leading: const Icon(Icons.home),
                  title: new TextField(
                    decoration: const InputDecoration(
                        hintText: 'Search for address...'),
                  ),
                ),
              ),
              new Card(
                child: new ListTile(
                  leading: const Icon(Icons.location_on),
                  title: new Text('Latitude: 48.09342\nLongitude: 11.23403'),
                  trailing: new IconButton(
                      icon: const Icon(Icons.my_location), onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    return tabbedView;
  }
}
