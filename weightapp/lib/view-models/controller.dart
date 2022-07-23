import 'package:get/get.dart';
import 'package:getxuse/models/record.dart';
import 'package:getxuse/screen/createRecord.dart';
import 'package:getxuse/screen/notes.dart';

class Controller extends GetxController {
  var records = <Record>[
    // Record(weight: 10, dateTime: DateTime.now(), note: "normal"),
    // Record(weight: 20, dateTime: DateTime.now(), note: "gayet iyi"),
    // Record(weight: 30, dateTime: DateTime.now(), note: "abartmazsan iyi"),
    // Record(weight: 40, dateTime: DateTime.now(), note: "abartma"),
    // Record(weight: 50, dateTime: DateTime.now(), note: "çok abarttın"),
  ].obs;

  void addRecord({required weight, required dateTime, required note}) {
    records.add(Record(weight: weight, dateTime: dateTime, note: note));
  }

  void deleteRecord(Record record) {
    records.remove(record);
  }

  void editRecord({required note}) {
    Get.to(Notes(
      note: note,
    ));
  }
}
