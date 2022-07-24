# iOS client app for Twitter
![](https://img.shields.io/badge/Xcode-13.2.1%2B-blue.svg)
![](https://img.shields.io/badge/iOS-13.0%2B-blue.svg)
![](https://img.shields.io/badge/Swift-5.5.2%2B-orange.svg)  

Using Twitter api, get tweets from your time line.
This App is also made by Swift Concurrency.

## Library dependencies
- [SnapKit](https://github.com/SnapKit/SnapKit)

All libraries is installed via SwiftPackageManager.
You can check all library dependencies [here](https://github.com/tosh7/Twitter/blob/async_and_await/Twitter.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved).

## How to start
1. Clone this repository.
2. Make `Twitter.plist` such as below. And replace consumer_key and consumer_secret to Twitter API's APIKey and APISecretKey.
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>consumer_key</key>
	<string></string>
	<key>consumer_secret</key>
	<string></string>
</dict>
</plist>
```

`Twitter.plist` is already added in `.gitignore` file for the security.

## How to use
TBD

## How it works
TBD

## API Docs
All API documents are referenced by [Twitter API v2](https://developer.twitter.com/en/docs).
