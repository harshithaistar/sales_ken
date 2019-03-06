import 'package:flutter/material.dart';
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
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> randomTasks;
  @override
  Widget build(BuildContext context) {
    randomTasks = Task.getRandomTasks(40);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(
            "Call Logs",
            style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
                fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Icon(Icons.notifications),
            ),
            new Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: getCallsListBody(),
        floatingActionButton: new FloatingActionButton(
            elevation: 10.0,
            child: new Icon(Icons.filter),
            backgroundColor: new Color(0xFFE57373),
            onPressed: () {}));
  }

  Widget getCallsListBody() {
    var list = ListView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: randomTasks.length,
      itemBuilder: (BuildContext context, int index) {
        return getCallCard(index);
      },
    );

    return list;
  }

  Widget getCallCard(int i) {
    var card = Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.5, 0.0, 0.5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    randomTasks[i].caller,
                    style: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0),
                  ),
                  Text(
                    randomTasks[i].calleeNumber,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 6.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: Text(
                        randomTasks[i].calleeName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22.0),
                      ),
                      flex: 3,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        height: 40.0,
                        width: 40.0,
                        child: Icon(Icons.cloud_download, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 2.0, 0.0, 12.0),
                        child: Text(
                          randomTasks[i].calleeCompanyName,
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Text(
                        randomTasks[i].date + "    " + randomTasks[i].time,
                        style: TextStyle(
                            color: Colors.black45, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Text(
                    randomTasks[i].duration,
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );

    /*var card = ListTile(
      leading: Icon(Icons.call),
      title: Text(randomTasks[i].caller),
      subtitle: Text(randomTasks[i].calleeName),
      trailing: Text(randomTasks[i].duration),
      );*/
    return card;
  }
}
