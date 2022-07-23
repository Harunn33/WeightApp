import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getxuse/config/generalColors.dart';
import 'package:getxuse/config/generalPadding.dart';
import 'package:getxuse/models/record.dart';
import 'package:getxuse/view-models/controller.dart';
import 'package:getxuse/screen/homePage.dart';
import 'package:intl/intl.dart';

class RecordListTile extends StatelessWidget {
  final Record record;
  RecordListTile({Key? key, required this.record}) : super(key: key);
  final Controller controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ProjectPadding.eight),
      child: Card(
        margin: EdgeInsets.only(top: 2 * ProjectPadding.eight + 4),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ProjectPadding.eight + 2)),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ProjectPadding.eight,
              vertical: 2.5 * ProjectPadding.eight),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 1.5 * ProjectPadding.eight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    buildIconText(context: context, text: "Notes"),
                    SizedBox(
                      width: 2 * ProjectPadding.eight + 3,
                    ),
                    buildIconText(context: context, text: "Delete")
                  ],
                ),
              ),
              ListTile(
                leading: _buildDate(context),
                title: _buildWeight(context),
                trailing: _buildIcon(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text buildIconText({required BuildContext context, required String text}) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4
          ?.copyWith(fontSize: 2.2 * ProjectPadding.eight),
    );
  }

  Row _buildIcon(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {
            controller.editRecord(note: record.note);
          },
          icon: Icon(
            FontAwesomeIcons.edit,
          ),
          color: ColorsPalette.greyColor,
        ),
        SizedBox(
          width: 16,
        ),
        IconButton(
          onPressed: () {
            controller.deleteRecord(record);
          },
          icon: Icon(FontAwesomeIcons.ban),
          color: ColorsPalette.redColor,
        ),
      ],
    );
  }

  Center _buildWeight(BuildContext context) {
    return Center(
      child: Text(
        "${record.weight} kg",
        style: Theme.of(context).textTheme.headline5?.copyWith(
            fontSize: 3 * ProjectPadding.eight - 3,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Text _buildDate(BuildContext context) {
    return Text(
      DateFormat("EEE,MMM d").format(record.dateTime),
      style: Theme.of(context).textTheme.headline2?.copyWith(
            fontSize: 2 * ProjectPadding.eight + 2,
          ),
    );
  }

  IconButton createIconButton({
    required IconData icon,
    required Color iconColor,
  }) =>
      IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          color: iconColor,
        ),
      );
}
