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
      home: new MyDashboardPage(),
    );
  }
}

class MyDashboardPage extends StatefulWidget {
  @override
  _MyDashboardPageState createState() => new _MyDashboardPageState();
}

class _MyDashboardPageState extends State<MyDashboardPage> {
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
              child: IconButton(
                  icon: Icon(Icons.notifications),

                  //its used to route the notification page from the notification icon click.
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotifcationScreen()),
                    );
                  }),
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
                      ),
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

    return card;
  }
}

class NotifcationScreen extends StatelessWidget {
  List<Notify> randomNotifications;
  @override
  Widget build(BuildContext context) {
    randomNotifications = Notify.getRandomNotify(40);
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context)
              .pop(), //This used to go back to the previous page
        ),
        title: new Text(
          "Notifications",
          style: TextStyle(
              color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: getCallsListBody(),
    );
  }

  Widget getCallsListBody() {
    var list = ListView.separated(
      padding: EdgeInsets.all(8.0),
      itemCount: randomNotifications.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return getCallCard(index);
      },
    );

    return list;
  }

  Widget getCallCard(int i) {
    var card = ListTile(
      leading: Image.network(randomNotifications[i].fromPersonImageUrl),
      title: Text(randomNotifications[i].displayMessage),
      subtitle: Text(randomNotifications[i].date),
    );
    return card;
  }
}
