# Twitterのクライアントアプリ

Twitterのアカウントでログインをして、タイムラインを取得してくるアプリです。

## 使用しているライブラリ
- TwitterKit
- SwiftyJSON
- RealmSwift

全てcocoapodsを使用

## アプリの動作説明
StartViewControllerでログイン管理をし、そこでタイムラインの情報を10件取得してきています。
そのまま、ここでRealmをしようし保存しています。

TimeLineViewCellでRealmから値を取ってきてCellに入れるようにしています。

アーキテクチャがあまり綺麗にできていなく無駄が多いので、ここの部分をもう少し変更したいと考えています。

## 実機での動作動画
![](https://media.giphy.com/media/kPIeuTEeQbM9uULrr8/giphy.gif)
