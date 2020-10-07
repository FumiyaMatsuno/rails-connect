# README
<h1 align="center">Rails Connect</h1>

- Ruby on Rails初学者向けの用語検索サイトです。
- 何を調べたら良いの？、このエラーを解決するには？とお困りの初学者の方に、最適な参照すべきサイトを効率的に見つける事ができる用語検索サイトになっております。
- こちらのサービスは、同経験をした有志の方々の投稿により、作りあげられているRails辞典になります。
- 作成期間 2020/9/28 ~ 2020/10/7
 ![top_page](https://i.gyazo.com/ec902bbeb37996a96d1e9c9b74bebef9.png)

<br>

---
## :paperclip: 主な使用言語
---
<a><img src="https://user-images.githubusercontent.com/39142850/71774533-1ddf1780-2fb4-11ea-8560-753bed352838.png" width="70px;" /></a> <!-- rubyのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774548-731b2900-2fb4-11ea-99ba-565546c5acb4.png" height="60px;" /></a> <!-- RubyOnRailsのロゴ -->
<a><img src="https://cdn.svgporn.com/logos/html-5.svg" height="60px;" /></a> <!-- htmlのロゴ -->
<a><img src="https://cdn.svgporn.com/logos/css-3.svg" height="60px;" /></a> <!-- cssのロゴ -->
<a><img src="https://cdn.svgporn.com/logos/javascript.svg" height="60px" /></a> <!-- JavaScriptのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774768-d064a980-2fb7-11ea-88ad-4562c59470ae.png" height="65px;" /></a> <!-- jQueryのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774786-37825e00-2fb8-11ea-8b90-bd652a58f1ad.png" height="60px;" /></a> <!-- AWSのロゴ -->
<a><img src="https://syncer.jp/storage/web/brand-logos/static/dst/github-logo-001.png" height="60px;" /></a> <!-- GitHubのロゴ -->
---

<br>

## 機能紹介
- 新規会員登録・ログインをすると、用語の参照先URLを投稿できます。
- 新規会員登録、ログインがお済みでない方も用語一覧や詳細は閲覧できます。
- 。


## サイトURL紹介
- アドレス:https://rails-connect-app.herokuapp.com/


## テスト用アカウント
1.マスター用
- email: master_user@gmail.com
- password: master0000

2.閲覧用
- email: test_user@gmail.com
- password: test0000


## :globe_with_meridians: インストール方法
1.このリポジトリを複製<br>
`$ git clone https://github.com/xfm04x/rails-connect.git`
2.インストールしたリポジトリに移動<br>
`$ cd rails-connect.git`
3.gemをアプリケーションに適用<br>
`$ bundle install`<br>
4.DBの作成&反映<br>
`$ rails db:create`<br>
`$ rails db:migrate`<br>
5.カテゴリ一覧の反映<br>
`$ rails db:seed`<br>
6.アプリケーションの起動<br>
`$ rails s`<br>
:point_right:`http://localhost:3000`


***デモ(投稿)***

![デモ](https://i.gyazo.com/476bb4ad97bb5d264a89e384a28eab47.gif)


***デモ(検索）***

![デモ](https://i.gyazo.com/9c8e6bccc2cf7fb582e626fdc150bf8b.gif)


## 機能

- 機能1（UI/計算 etc ...）
- 機能2
- 機能3
- ...


## 必要要件

- 要件
- 要件
- 要件
- ...

## 使い方

1. 使い方
2. 使い方
3. 使い方


## テスト

1. 使い方
2. 使い方
3. 使い方

## デプロイ

1. デプロイ
2. デプロイ
3. デプロイ

# :page_facing_up: DB設計

## ER図
![er](https://i.gyazo.com/94939feb0bebbf9f2aa62d55a7ca4e97.png)

## user
|種類        | Column     | Type       | Options      |追記           |
|-----------|------------|-------------|--------------|--------------|
|ニックネーム|nickname|string|null: false||
|メールアドレス|email|string|null: false||
|パスワード|password|text|null: false||
### Association
* has_many :terms, foreign_key: :user_id, dependent: :destroy
* has_many :likes


## term
|種類        | Column     | Type       | Options      |追記           |
|-----------|------------|-------------|--------------|--------------|
|用語|title|string|null: false||
|引用先|reference|string|null: false||
|URL|text|text|null: false||
|ジャンル|genre_id|integer|null: false|Active_hash|
|ユーザーID|user|references|null: false|foreign_key: true|
### Association
* belongs_to_active_hash :genre
* belongs_to :user
* has_many :likes

## like
|種類        | Column     | Type       | Options      |追記           |
|-----------|------------|-------------|--------------|--------------|
|ユーザーID|user_id|integer|||
|用語ID|term_id|integer|||
### Association
* belongs_to :user
* belongs_to :term


## その他

その他


## 作者

[Fumiya Matsuno]()
mail to: xfmakma@gmail.com
