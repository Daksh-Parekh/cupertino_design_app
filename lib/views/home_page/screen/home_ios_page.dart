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
  @override
  Widget build(BuildContext context) {
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
        child: CupertinoButton.filled(
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
      ),
    );
  }
}
