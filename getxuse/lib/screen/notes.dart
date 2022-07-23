import 'package:flutter/material.dart';
import 'package:getxuse/config/generalPadding.dart';
import 'package:getxuse/screen/createRecord.dart';

class Notes extends StatefulWidget {
  Notes({Key? key, required this.note}) : super(key: key);
  String note;
  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Notes")),
      body: Center(
        child: Container(
            child: Text(
          widget.note,
          style: Theme.of(context).textTheme.headline5?.copyWith(
                fontSize: 4 * ProjectPadding.eight,
              ),
        )),
      ),
    );
  }
}
