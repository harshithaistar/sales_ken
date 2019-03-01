import 'package:flutter/material.dart';
import 'customObjects.dart';

class NotifcationScreen extends StatefulWidget {
  @override
  _NotifcationScreenState createState() => new _NotifcationScreenState();
}

class _NotifcationScreenState extends State<NotifcationScreen> {
  List<Notify> randomNotifications;
  @override
  Widget build(BuildContext context) {
    randomNotifications = Notify.getRandomNotify(40);
    return new Scaffold(
      appBar: new AppBar(
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
      //trailing: Text(randomNotifications[i].duration),
    );
    return card;
  }
}
