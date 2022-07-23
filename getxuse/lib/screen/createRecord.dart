import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getxuse/components/datePickerTheme.dart';
import 'package:getxuse/config/generalColors.dart';
import 'package:getxuse/config/generalPadding.dart';
import 'package:getxuse/view-models/controller.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateRecord extends StatefulWidget {
  CreateRecord({Key? key}) : super(key: key);

  @override
  State<CreateRecord> createState() => _CreateRecordState();
}

final Controller controller = Get.find();

class _CreateRecordState extends State<CreateRecord> {
  int _selectedWeight = 70;
  DateTime _selectedDate = DateTime.now();
  final _myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create Record")),
      body: ListView(
        padding: EdgeInsets.symmetric(
            horizontal: 2 * ProjectPadding.eight, vertical: Get.height / 7),
        children: [
          Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2 * ProjectPadding.eight),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 2 * ProjectPadding.eight - 2,
                      top: 3 * ProjectPadding.eight,
                      bottom: 3 * ProjectPadding.eight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        FontAwesomeIcons.weightScale,
                        color: ColorsPalette.seaGreen,
                        size: 5 * ProjectPadding.eight,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          NumberPicker(
                            axis: Axis.horizontal,
                            selectedTextStyle: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: ColorsPalette.seaGreen),
                            itemHeight: 7.5 * ProjectPadding.eight,
                            itemWidth: Get.width / 4,
                            minValue: 40,
                            maxValue: 140,
                            value: _selectedWeight,
                            onChanged: (value) {
                              setState(() {
                                _selectedWeight = value;
                              });
                            },
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorsPalette.seaGreen),
                              borderRadius:
                                  BorderRadius.circular(ProjectPadding.eight),
                            ),
                          ),
                          Icon(
                            FontAwesomeIcons.chevronUp,
                            color: ColorsPalette.seaGreen,
                            size: 2 * ProjectPadding.eight + 4,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  pickDate(context);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(2 * ProjectPadding.eight),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 2 * ProjectPadding.eight - 2,
                      vertical: 4 * ProjectPadding.eight,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          FontAwesomeIcons.calendar,
                          color: ColorsPalette.seaGreen,
                          size: 5 * ProjectPadding.eight,
                        ),
                        Expanded(
                          child: Text(
                            DateFormat("EEEE,MMM d").format(_selectedDate),
                            style:
                                Theme.of(context).textTheme.headline4?.copyWith(
                                      fontSize: 3.3 * ProjectPadding.eight,
                                      color: ColorsPalette.seaGreen,
                                    ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2 * ProjectPadding.eight),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 2 * ProjectPadding.eight - 2,
                      vertical: 2.4 * ProjectPadding.eight),
                  child: TextFormField(
                    controller: _myController,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.note_add_outlined,
                        size: 6 * ProjectPadding.eight,
                        color: ColorsPalette.seaGreen,
                      ),
                      hintText: "Enter your note please",
                      labelText: "Note",
                      labelStyle: TextStyle(
                        color: ColorsPalette.darkSeaGreen,
                        fontSize: 3.2 * ProjectPadding.eight,
                      ),
                      hintStyle: TextStyle(color: ColorsPalette.seaGreen),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorsPalette.seaGreen),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 6 * ProjectPadding.eight),
              ElevatedButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => ColorsPalette.seaGreen),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => EdgeInsets.symmetric(
                        horizontal: 1.5 * ProjectPadding.eight,
                        vertical: 2 * ProjectPadding.eight),
                  ),
                ),
                onPressed: () {
                  controller.addRecord(
                    weight: _selectedWeight,
                    note: _myController.text,
                    dateTime: _selectedDate,
                  );
                  if (_myController.text != isBlank) {
                    _myController.text = "";
                  }
                },
                icon: Icon(Icons.save_alt_outlined),
                label: Text(
                  "Save Record",
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                        fontSize: 2.5 * ProjectPadding.eight,
                        color: ColorsPalette.whiteColor,
                      ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> pickDate(BuildContext context) async {
    var newDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(Duration(days: 365)),
      lastDate: _selectedDate.add(Duration(days: 30)),
      builder: (context, child) {
        return DatePickerTheme(
          child: child,
        );
      },
    );

    if (newDate != null) {
      _selectedDate = newDate;
    }
    setState(() {});
  }
}
