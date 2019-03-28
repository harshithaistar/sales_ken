import 'package:flutter/material.dart';
//import 'TimeLineModel.dart';

import 'TranscriptsModel.dart';
import 'customObjects.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<Transcript> transcriptList;

  TaskDetails taskDetails = TaskDetails.dummy();
  TabController tabController;
  String dropdownValue = '1X';

//This is used for floatingActionButtons
  var fabIcon = Icons.send;

  @override
  void initState() {
    //todo: implement initState
    super.initState();

    tabController = TabController(vsync: this, length: 3)
      ..addListener(() {
        setState(() {
          switch (tabController.index) {
            case 0:
              break;
            case 1:
              fabIcon = Icons.add;
              break;
            case 2:
              fabIcon = Icons.insert_comment;
              break;
            case 3:
              fabIcon = Icons.insert_comment;
              break;
          }
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: getCallScreenAppBar(),

        //This tabbar displays below the title
        bottom: TabBar(
          tabs: [
            Tab(
              child: Text("TimeLine"),
            ),
            Tab(
                child: Text(
              "Transcription",
            )),
            Tab(
                child: Text(
              "Comments",
            )),
          ],
          indicatorColor: Colors.white,
          controller: tabController,
        ),
      ),

      //TabBarView is to view each page while switching between tabs
      body: TabBarView(
        controller: tabController,
        children: [
          //This listview is for TimeLine
          ListView.builder(
            itemBuilder: (context, position) {
              var timeLine = getTimeLineView();

              return timeLine;
            },
            itemCount: 40,
          ),

          //This listview is for Transcription
          ListView.builder(
            itemBuilder: (context, position) {
              var transcriptionPage = getTranscriptionView(taskDetails);

              return transcriptionPage;
            },
            itemCount: Transcript.itemCount,
          ),

          //This listview is for Comments
          ListView.builder(
            itemBuilder: (context, position) {
              var commentsPage = getCommentsView();

              return commentsPage;
            },
            itemCount: Comments.itemCount,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
    );
  }

  Widget getCallScreenAppBar() {
    var centerPiece = Column(
      children: <Widget>[
        Text('Stark Industries | Gong.io'),
        Text(
          'march, 2019',
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

  Widget getTimeLineView() {
    var controlGraph = SizedBox(
      height: MediaQuery.of(context).size.height * 0.50,
      width: MediaQuery.of(context).size.width,
    );
    var commentView = Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(hintText: ' Comment here...'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.send, color: Colors.red[500]),
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
        controlGraph,
        commentView,
        controlSectionGraph,
        controlSectionButtons
      ],
    );
  }

  Widget getCommentsView() {
    var card = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(hintText: 'comment here'),
              ),
              new RaisedButton(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  'Comment',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                color: Theme.of(context).accentColor,
                elevation: 4.0,
                splashColor: Colors.red[500],
                onPressed: () {
                  print('comment button pressed');
                  // Perform some action
                },
              ),
            ],
          ),
        ),
      ),
    );
    return card;
  }

  Widget getTranscriptionView(TaskDetails taskDetails) {
    List<Widget> snips = new List<Widget>();
    for (Snippet snippet in taskDetails.snippets) {
      if (snippet.speaker == 'Agent')
        snips.add(getAgentSnippet(snippet));
      else
        snips.add(getCustomerSnippet(snippet));
    }
    var appBar =
        Column(children: snips, mainAxisAlignment: MainAxisAlignment.start);
    return appBar;
  }

  getAgentSnippet(Snippet snippet) {
    return Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          child: new Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
              ),
              new Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: new CircleAvatar(child: new Text('A')),
              ),
              Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                    ),
                    new Text('Agent',
                        style: Theme.of(context).textTheme.subhead),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(
                        snippet.text,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  getCustomerSnippet(Snippet snippet) {
    return Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.only(right: 20.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
              ),
              Expanded(
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0)),
                    new Text(
                      'Customer',
                      style: Theme.of(context).textTheme.subhead,
                    ),
                    new Container(
                      margin: const EdgeInsets.only(top: 5.0),
                      child: new Text(snippet.text),
                    ),
                  ],
                ),
              ),
              new Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                child: new CircleAvatar(child: new Text('C')),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
