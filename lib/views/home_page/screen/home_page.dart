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
  HomeProvider? hR, hW;
  @override
  Widget build(BuildContext context) {
    hR = context.read<HomeProvider>();
    hW = context.watch<HomeProvider>();
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
            TextButton.icon(
              onPressed: () async {
                DateTime? d1 = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2001),
                  lastDate: DateTime(2030),
                );
                hR?.changeDate(d1!);
                // context.read<HomeProvider>().changeDate(d1!);
              },
              icon: Icon(Icons.calendar_month_rounded),
              label: Text("${hW?.date.day}/${hW?.date.month}/${hW?.date.year}"),
            ),
            TextButton.icon(
              onPressed: () async {
                TimeOfDay? timePick = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                hR?.changeTime(timePick!);
              },
              icon: Icon(Icons.timer),
              label: Text("${hW!.time.hour}:${hW?.time.minute}"),
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
