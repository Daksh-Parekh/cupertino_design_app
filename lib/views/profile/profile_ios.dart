import 'package:cupertino_app_design/views/home_page/provider/home_provider.dart';
import 'package:cupertino_app_design/views/home_page/screen/home_ios_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ProfilePageIos extends StatefulWidget {
  const ProfilePageIos({super.key});

  @override
  State<ProfilePageIos> createState() => _ProfilePageIosState();
}

class _ProfilePageIosState extends State<ProfilePageIos> {
  late HomeProvider hRead, hWatch;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 12),
        middle: CupertinoSegmentedControl(
          children: {
            'Photo': Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text("Photo"),
            ),
            'Personal Info': Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Personal Info"),
            ),
            'save': Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Save Info"),
            ),
          },
          onValueChanged: (value) {
            hRead.segmentIndex(value);
          },
          groupValue: hWatch.selectedSegment,
        ),
      ),
      child: Center(
        child: Text("${hWatch.selectedSegment}"),
      ),
    );
  }
}
