import 'package:cupertino_app_design/views/home_page/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("Android"),
        actions: [
          Switch(
            value: context.watch<HomeProvider>().isAndroid,
            onChanged: (value) {
              context.read<HomeProvider>().plathformChange();
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ModalBottomSheet(context);
              },
              child: Text("Modal BottomSheet"),
            ),
            ElevatedButton(
              onPressed: () {
                scaffoldKey.currentState?.showBottomSheet(
                  (context) {
                    return BottomSheet(
                      onClosing: () {},
                      builder: (context) {
                        return Container(
                          width: double.infinity,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("CLOSE"),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
              child: Text("Bottom Sheet"),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> ModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomSheet(
          onClosing: () {},
          builder: (context) {
            return SizedBox(
              height: 200,
              child: Text("Modal Bottom Sheet"),
            );
          },
        );
      },
    );
  }
}
