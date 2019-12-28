For help getting started with Flutter, view our online
[documentation](https://flutter.io/).


[![Pub](https://img.shields.io/badge/Pub-0.1.4-orange.svg?style=flat-square)](https://pub.dartlang.org/packages/qr_utils)



# qr_utils

A new Flutter QR scanner and generator plugin. This plugin is use for scanning 1D barcode and 2D QR code and generating QR code as well.

### Implementation in Flutter

Simply add a dependency to you pubspec.yaml for qr_utils.

Then import the package in your dart file with

```dart
import 'package:qr_utils/qr_utils.dart';
```


### Screenshots

### iOS

<img height="420px" src="https://github.com/flutter-devs/qr_utils/blob/master/assets/screenshots/Screenshot_ios_1.png"> <img height="420px" src="https://github.com/flutter-devs/qr_utils/blob/master/assets/screenshots/Screenshot_ios_2.png"> <img height="420px" src="https://github.com/flutter-devs/qr_utils/blob/master/assets/screenshots/Screenshot_ios_3.png">

### Android

<img height="420px" src="https://github.com/flutter-devs/qr_utils/blob/master/assets/screenshots/Screenshot_android_1.png"> <img height="420px" src="https://github.com/flutter-devs/qr_utils/blob/master/assets/screenshots/Screenshot_android_2.png"> <img height="420px" src="https://github.com/flutter-devs/qr_utils/blob/master/assets/screenshots/Screenshot_android_3.png">


### Usages

1. Scan QR

    ```dart
    // Scan QR
    final content = await QrUtils.scanQR;
    ```

2. Generate QR

     ```dart
     // Generate QR
    Image image = await QrUtils.generateQR(content);
    ```
