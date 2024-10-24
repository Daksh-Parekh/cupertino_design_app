import 'dart:developer';
import 'dart:io';

import 'package:cupertino_app_design/views/home_page/provider/home_provider.dart';
import 'package:cupertino_app_design/views/home_page/screen/home_ios_page.dart';
import 'package:cupertino_app_design/views/home_page/screen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  if (Platform.isAndroid) {
    log('Android');
  } else {
    log('iOS');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: HomeProvider())],
      child: Consumer<HomeProvider>(
        builder: (context, value, child) {
          return value.isAndroid
              ? MaterialApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => HomePage(),
                  },
                )
              : CupertinoApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    '/': (context) => HomeIosPage(),
                  },
                );
        },
      ),
    );
  }
}
