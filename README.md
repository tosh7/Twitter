# iOS client app for Twitter
![](https://img.shields.io/badge/Xcode-13.2.1%2B-blue.svg)
![](https://img.shields.io/badge/iOS-13.0%2B-blue.svg)
![](https://img.shields.io/badge/Swift-5.5.2%2B-orange.svg)  

Using Twitter api, get tweets from your time line.
This App is also made by Swift Concurrency.

## Libraries
- RealmSwift

All libraries is installed via Cocoapods.

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

## Special Thanks
For the api client part, this project's codes are refrenced. 
https://github.com/kean/Get 
