import 'package:flutter/material.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reel"),
      ),
      body: PageView.builder(
        itemCount: 10,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.amber.shade200,
            child: Text(
              "${index + 1}",
              style: TextStyle(fontSize: 25),
            ),
          );
        },
      ),
    );
  }
}
