# iOS client app for Twitter
![](https://img.shields.io/badge/Xcode-13.4.1%2B-blue.svg)
![](https://img.shields.io/badge/iOS-15.0%2B-blue.svg)
![](https://img.shields.io/badge/Swift-5.6.1%2B-orange.svg)  

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
	<key>bearer_token</key>
	<string></string>
	<key>client_id</key>
	<string></string>
	<key>oauth2_state</key>
	<string></string>
	<key>oauth2_code_challenge</key>
	<string></string>
</dict>
</plist>
```

`Twitter.plist` is added in `.gitignore` file for the security.

Twitter authentification is base on OAuth2.  
oauth_state and oauth_code_challenge is generated base on below document.
https://datatracker.ietf.org/doc/html/rfc7636

## How to use
1. Press 'Sign in with Twitter' button
2. Then, you will get your timeline.

## How it works

https://user-images.githubusercontent.com/27297319/181052670-de4e84a1-8608-4c8a-ba80-f5848762fc96.mov




## API Docs
All API documents are referenced by [Twitter API v2](https://developer.twitter.com/en/docs).
