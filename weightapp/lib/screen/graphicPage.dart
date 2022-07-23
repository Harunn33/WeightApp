import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GraphicPage extends StatefulWidget {
  const GraphicPage({Key? key}) : super(key: key);

  @override
  State<GraphicPage> createState() => _GraphicPageState();
}

class _GraphicPageState extends State<GraphicPage> {
  String appBarText = "Graphic";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$appBarText"),
      ),
      body: Center(
        child: Container(
          child: Text("Graphic Screen"),
        ),
      ),
    );
  }
}
