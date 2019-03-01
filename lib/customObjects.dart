import 'package:faker/faker.dart';

class Task {
  String caller;
  String calleeNumber;
  String calleeCompanyName;
  String calleeName;
  String duration;
  String date;
  String time;

  static List<Task> getRandomTasks(int count) {
    var faker = new Faker();
    List<Task> tasks = new List<Task>();
    for (int i = 0; i < count; i++) {
      Task t = new Task();
      t.caller = faker.person.name();
      t.calleeNumber = faker.randomGenerator.numbers(1234, 2)[0].toString();
      t.calleeCompanyName = 'Company Name';
      t.calleeName = faker.person.name();
      t.duration = 'Duration';
      t.time = '12:00';
      t.date = '2 days ago';
      tasks.add(t);
    }
    return tasks;
  }
}

class Notify {
  String fromPersonImageUrl;
  String displayMessage;
  String date;

  static List<Notify> getRandomNotify(int count) {
    var faker = new Faker();
    List<Notify> notify = new List<Notify>();
    for (int i = 0; i < count; i++) {
      String fname = faker.person.firstName();
      Notify n = new Notify();
      n.fromPersonImageUrl = 'https://business.talentify.in/users/' +
          fname.substring(0, 1).toUpperCase() +
          '.png';
      n.displayMessage = 'This is the notification message';
      n.date = '2 days ago';
      notify.add(n);
    }
    return notify;
  }
}
