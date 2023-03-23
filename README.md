# SI Location
This plugin for Flutter handles getting a location on Android and iOS. It also provides callbacks when the location is changed.

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
