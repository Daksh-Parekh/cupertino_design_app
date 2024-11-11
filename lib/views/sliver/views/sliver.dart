import 'package:flutter/material.dart';

class Sliver extends StatefulWidget {
  const Sliver({super.key});

  @override
  State<Sliver> createState() => _SliverState();
}

class _SliverState extends State<Sliver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Sliver Page"),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // title: Text("Sliver"),
            floating: true,
            // pinned: true,
            expandedHeight: 100,
            backgroundColor: Colors.amberAccent,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Slivers"),
              centerTitle: true,
            ),
          ),
          SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("Items: ${index}"),
              );
            },
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              width: 200,
              margin: EdgeInsets.all(16),
              color: Colors.red,
              child: FlutterLogo(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 80,
                    width: 80,
                    margin: EdgeInsets.all(10),
                    color: Colors.blueGrey,
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverGrid.builder(
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.amberAccent.shade100,
              );
            },
          ),
        ],
      ),
    );
  }
}
