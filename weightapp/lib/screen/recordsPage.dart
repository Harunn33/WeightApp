import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxuse/components/recordListTile.dart';
import 'package:getxuse/config/generalPadding.dart';
import 'package:getxuse/models/record.dart';
import 'package:getxuse/view-models/controller.dart';

class RecordsPage extends StatefulWidget {
  const RecordsPage({Key? key}) : super(key: key);

  @override
  State<RecordsPage> createState() => _RecordsPageState();
}

class _RecordsPageState extends State<RecordsPage> {
  final Controller _controller = Get.put(Controller());
  String appBarText = "Records";
  @override
  Widget build(BuildContext context) {
    List<Record> records = _controller.records;
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text("$appBarText"),
        ),
        body: records.isEmpty
            ? Center(
                child: Container(
                    child: Text(
                  "No records at this time.",
                  style: Theme.of(context).textTheme.headline4?.copyWith(
                        fontSize: 3 * ProjectPadding.eight,
                      ),
                )),
              )
            : ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 30),
                children: records
                    .map((record) => RecordListTile(record: record))
                    .toList(),
              ),
      ),
    );
  }
}
