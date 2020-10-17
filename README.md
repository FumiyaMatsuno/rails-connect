# README
<h1 align="center">Rails Connect</h1>

- Ruby on Rails初学者向けの用語共有検索サイト
- 私自身、自走力を身に付ける為に「調べて解決する」事に拘りました。一方で、検索しても見つからない、読んでも分からない、この事により数時間問題を解決出来ない場面を多々経験致しました。
同期の方と話す中で、初学者悩む所は同じだと感じ、その負を解消したら良いのではとの思いから作成しました。
- 「何を調べたら良いの？」、「このエラーを解決するには？」とお困りの初学者の方が、「参照すべきサイト」を最短距離で効率的に見つける事ができる<b>「情報共有検索サービス」</b>です。
- こちらのサービスは、同様の経験をした有志の方々の投稿により、作りあげられている辞典になります。
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
<a><img src="https://www.docker.com/sites/default/files/d8/styles/role_icon/public/2019-07/Docker-Logo-White-RGB_Horizontal.png?itok=cFIHFZiP" height="60px;" /></a> <!-- Dockerのロゴ -->
<a><img src="https://user-images.githubusercontent.com/39142850/71774786-37825e00-2fb8-11ea-8b90-bd652a58f1ad.png" height="60px;" /></a> <!-- AWSのロゴ -->
<a><img src="https://syncer.jp/storage/web/brand-logos/static/dst/github-logo-001.png" height="60px;" /></a> <!-- GitHubのロゴ -->
---

<br>

<img width="1440" alt="スクリーンショット 2020-10-16 10 40 31" src="https://i.gyazo.com/c84613d29dffd1cdaf941cc46288e7d0.png">

## 機能紹介
- 新規会員登録・ログインをすると、用語の参照先URLを投稿できます。
- 新規会員登録、ログインがお済みでない方も用語一覧や詳細は閲覧できます。 


## サイトURL紹介
デプロイ:AWS
- アドレス:http://54.95.37.191:3000/


デプロイ:Heroku

- アドレス:https://rails-connect-app.herokuapp.com/

## テスト用アカウント
1.マスター用
- email: master_user@gmail.com
- password: master0000

2.閲覧用
- email: test_user@gmail.com
- password: test0000

3.ゲストユーザー
- ゲストログイン機能
- 登録のお手間を省きログインして頂けます。


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

- ユーザー管理機能
- ゲストユーザー機能(ゲストの方にお手間を取らせない為)
- 用語投稿機能
- URLアクセス機能(投稿したURLから直接参照先へアクセスする為)
- 詳細閲覧機能
- 投稿編集削除機能
- ジャンル別閲覧機能
- 検索機能
- いいね機能(投稿者を評価する為)



## 使用技術

1. AWS/本番環境（EC2, VPC, EIP, IAM, Route53）
2. Docker,Docker-compose（開発環境）
3. MySQL
4. puma
5. Javascript
6. Ruby 2.6.5, Rails 6.0.3.3
7. Mac Catalina(10.15.6)
8. Amazon Linux
9. VSCode, Vim

## 追加実装予定

1. RSpec（テストフレームワーク）
2. CircleCi（テスト・デプロイ）


---
# :page_facing_up: DB設計

## ER図
![er](https://i.gyazo.com/94939feb0bebbf9f2aa62d55a7ca4e97.png)

## userテーブル
|種類        | Column     | Type       | Options      |追記           |
|-----------|------------|-------------|--------------|--------------|
|ニックネーム|nickname|string|null: false||
|メールアドレス|email|string|null: false||
|パスワード|password|text|null: false||
### Association
* has_many :terms, foreign_key: :user_id, dependent: :destroy
* has_many :likes

<br>

## termテーブル
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

<br>

## likeテーブル
|種類        | Column     | Type       | Options      |追記           |
|-----------|------------|-------------|--------------|--------------|
|ユーザーID|user_id|integer|||
|用語ID|term_id|integer|||
### Association
* belongs_to :user
* belongs_to :term

<br>

---
## 作者
---

[Fumiya Matsuno]()
mail to: xfmakma@gmail.com
