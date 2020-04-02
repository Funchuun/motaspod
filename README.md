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

## User table

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false, unique: true, index: true|
|password|string|null: false|
### Association
- has_many tweets
- has_many supercools
- has_many cools
- has_many uncools

## Tweets table

|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|carname|string|null: false, index: true|
|year|integer|null: false, index: true|
|description|text|index: true|
|user_id|integer|foreign_key: true|
### Association
- belongs_to user
- has_many supercools
- has_many cools
- has_many uncools

## Supercools table

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### Association
- belongs_to user
- belongs_to tweet

## Cools table

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### Association
- belongs_to user
- belongs_to tweet

## Uncools table

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|
### Association
- belongs_to user
- belongs_to tweet
