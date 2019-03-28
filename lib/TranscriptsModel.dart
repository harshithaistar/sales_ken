//import 'dart:convert';

class TranscriptionModel {
  String text;
  String name;
  bool type;

  TranscriptionModel(this.text, this.name, this.type);
}

class Transcript {
  static List<TranscriptionModel> transcriptList = [
    TranscriptionModel("This is the Transription area", "meera", true)
  ];

  static TranscriptionModel getTranscriptItem(int position) {
    return transcriptList[position];
  }

  static var itemCount = transcriptList.length;
}
