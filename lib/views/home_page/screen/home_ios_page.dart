import 'package:cupertino_app_design/views/home_page/provider/home_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIosPage extends StatefulWidget {
  const HomeIosPage({super.key});

  @override
  State<HomeIosPage> createState() => _HomeIosPageState();
}

class _HomeIosPageState extends State<HomeIosPage> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("iOS"),
        leading: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded)),
        trailing: CupertinoSwitch(
          value: context.watch<HomeProvider>().isAndroid,
          onChanged: (value) {
            return context.read<HomeProvider>().plathformChange();
          },
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Cupertino Modal ACtion Button
            CupertinoButton.filled(
              child: Text("Modal ActionButton"),
              onPressed: () async {
                return await showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return CupertinoActionSheet(
                      title: Text("Hello"),
                      message: Text("Are you sure to close."),
                      actions: [
                        CupertinoActionSheetAction(
                          isDefaultAction: true,
                          onPressed: () {},
                          child: Text("YES"),
                        ),
                        CupertinoActionSheetAction(
                          onPressed: () {},
                          child: Text("NO"),
                        ),
                        CupertinoActionSheetAction(
                          isDestructiveAction: true,
                          onPressed: () {},
                          child: Text("Cancel"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            //Date Picker
            CupertinoButton(
              child: Text(
                  "${hWatch.date.day}/${hWatch.date.month}/${hWatch.date.year}"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      color: Colors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (value) {
                          hRead.changeDate(value);
                        },
                      ),
                    );
                  },
                );
              },
            ),
            //Time Picker
            CupertinoButton(
              child: Text("${hWatch.time.hour}:${hWatch.time.minute}"),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 200,
                      color: CupertinoColors.white,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.time,
                        onDateTimeChanged: (value) {
                          hRead.changeTime(
                            TimeOfDay(hour: value.hour, minute: value.minute),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
            //Alert Dialog
            CupertinoButton.filled(
              child: Text("Alert Dialog"),
              onPressed: () {
                showCupertinoDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: Text("Hello"),
                      content: Text("Are you sure to exit"),
                      actions: [
                        CupertinoDialogAction(
                          child: Text("YES"),
                          isDefaultAction: true,
                        ),
                        CupertinoDialogAction(
                          child: Text("NO"),
                          isDestructiveAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            //CupertinoSlider
            Text("${hWatch.sliderIndex.toStringAsFixed(2)}"),
            CupertinoSlider(
              min: 0,
              max: 10000,
              // divisions: 10,
              value: hWatch.sliderIndex,
              onChanged: (value) {
                hRead.changeSliderIndex(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
