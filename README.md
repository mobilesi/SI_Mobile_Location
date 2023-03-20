<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

1. Get current location
```dart
LocationModel? locationModel = await SILocation.get();
```

For iOS:
```plist
// This is probably the only one you need. Background location is supported
// by this -- the caveat is that a blue badge is shown in the status bar
// when the app is using location service while in the background.
NSLocationWhenInUseUsageDescription

// Deprecated, use NSLocationAlwaysAndWhenInUseUsageDescription instead.
NSLocationAlwaysUsageDescription

// Use this very carefully. This key is required only if your iOS app
// uses APIs that access the user’s location information at all times,
// even if the app isn't running.
NSLocationAlwaysAndWhenInUseUsageDescription
```

2. Background mode

2.1. Config
- Android
```xml
<uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
<uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
```
- iOS
```xml
<key>UIBackgroundModes</key>
<array>
	<string>location</string>
</array>
```

2.2. Enable background mode
```dart
SILocation.enableBackgroundMode(true);
```
2.3. Set callback
```dart
SILocation.setCallbackWhenLocationChange((LocationModel locationModel) {
    debugPrint("locationModel: ${locationModel.latitude} - ${locationModel.longitude}");
  });
```
