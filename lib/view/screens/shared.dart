import 'package:flutter/material.dart';

class SharedScreen extends StatefulWidget {
  final String title;

  const SharedScreen(this.title, {Key? key}) : super(key: key);

  @override
  _SharedScreenState createState() => _SharedScreenState();
}

class _SharedScreenState extends State<SharedScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(widget.title),
    );
  }
}

