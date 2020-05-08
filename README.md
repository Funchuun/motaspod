# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# アプリ名
## motaspod

# 概要
## あなたがカッコいいと思う車の写真を投稿し、共有するアプリです。
### ユーザーはアカウントを作成することで写真を投稿することができます。投稿時には車の名前や製造年、最大180文字までのひとこと文を一緒に投稿することができます。他のユーザーの投稿は3段階（超カッコいい、カッコいい、ブサイク）で評価をつけることができ、ユーザーマイページにて閲覧することが可能です。また、過去の投稿を検索することも可能です。

## 制作背景
### このアプリを制作・開発しようと思ったきっかけは、私自身まだ見ぬカッコいい車を知りたいと思ったからです。モータースポーツが趣味で、長年カッコいい車やレーシングカーを見てきましたが、私自身も知らないまだ見ぬカッコいい車を全世界の人から教えて頂きたいと思い、投稿型のアプリケーションを制作・開発をしました。

# データベース構造
## User table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many tweets
- has_many likes
- has_many like_tweets, through: :likes, source: :tweet

## Tweets table

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|carname|string|null: false|
|year|integer|null: false|
|description|text|null: false|
|user_id|integer||
### Association
- belongs_to user
- has_many likes
- has_many liking_users, through: :likes, source: :user

## Likes table

|Column|Type|Options|
|------|----|-------|
|rate|string||
|tweet_id|bigint|foreign_key: true|
|user_id|bigint|foreign_key: true|
### Association
- belongs_to user
- belongs_to tweet

