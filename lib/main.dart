import 'dart:developer';
import 'dart:io';

void main() {
  if (Platform.isAndroid) {
    log('Android');
  } else {
    log('iOS');
  }
  // runApp(MyApp());
}
