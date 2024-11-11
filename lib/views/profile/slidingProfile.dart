import 'package:cupertino_app_design/views/home_page/provider/home_provider.dart';
import 'package:cupertino_app_design/views/home_page/screen/home_ios_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SlidingprofileIos extends StatefulWidget {
  const SlidingprofileIos({super.key});

  @override
  State<SlidingprofileIos> createState() => _SlidingprofileIosState();
}

class _SlidingprofileIosState extends State<SlidingprofileIos> {
  late HomeProvider hWatch, hRead;
  @override
  Widget build(BuildContext context) {
    hRead = context.read<HomeProvider>();
    hWatch = context.watch<HomeProvider>();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: CupertinoSlidingSegmentedControl(
          groupValue: hWatch.selectedSlidingSegment,
          children: {
            'Photo': Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text("Photo"),
            ),
            'personal': Text("Personal Info"),
            'save': Text("Save Info"),
          },
          onValueChanged: (value) {
            hRead.SlidingControllerInx(value!);
          },
        ),
      ),
      child: Center(child: Text("${hWatch.selectedSlidingSegment}")),
    );
  }
}
