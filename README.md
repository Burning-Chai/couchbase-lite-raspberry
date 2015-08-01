# couchbase-lite-sample

このリポジトリは[https://github.com/couchbaselabs/couchbase-lite-local](https://github.com/couchbaselabs/couchbase-lite-local)の内容を少々修正したものになります。

変更点と共に作成したシェルの説明を行います。

# 変更点

**１. 内部で使用しているjarのバージョンアップ**

2015/04/24時点でSync GatewayとのReplicateを行うことができませんでした。そこで、内部で使用しているjarのバージョンを上げたところReplicateが無事動作しました。

**２. couchbase liteのusernameとpasswordをファイル出力**

couchbase-liteを起動した際にusernameとpasswordを標準出力します。それらを標準出力だけでなく、ファイルにも出力するようにしました。

**３．強制終了コマンドを受け付けない**

    trap("SIGINT") { exit! }

を削除

# jarの作成の仕方
上記の変更を行いましたので、再度jarを作成しました。

    $ jar cfm couchbase-lite-local-new.jar ./META-INF/MANIFEST.MF JarMain.class META-INF/ couchbase-lite-local

# 作成したシェルについて
shディレクトリ配下にあります。

## 1. couchbase lite 起動

    $ java -jar couchbase-lite-local-latest.jar

ここでusernameとpasswordが表示されます。これをメモしておいてください。

また、今回の修正でcouchbase_lite_info.txtにusernameとpasswordが出力されますので、そちらを参照ください。

## パラメータについて
 * file_name ... 起動時に作成されたファイルへのパス
 * couchbase_lite_username ... CouchbaseLite認証時のユーザネーム
 * couchbase_lite_passwoed ... CouchbaseLite認証時のパスワード
 * couchbase_lite_database_name ... CouchbaseLite上のデータベース名
 * json_data ... JSONデータ
 * query ... ドキュメント取得時の詳細パラメータ([参照](http://developer.couchbase.com/mobile/develop/references/couchbase-lite/rest-api/local-document/get---db--local--local-doc-/index.html))
 * syncgateway_ip ... SyncGatewayが起動しているサーバのIP(ポート番号付き)
 * syncgateway_database_name ... SyncGatewayで用意しているデータベース名

## 2. データベースの作成

    $ ./create_database file [file name] [database name]
    $ ./create_database [couchbase list username] [couchbase lite password] [database name]

## 3. データベースの取得

    $ ./get_database file [file name] [database name]
    $ ./get_database [couchbase list username] [couchbase lite password] [database name]

## 4. データベースの削除

    $ ./delete_database file [file name] [database name]
    $ ./delete_database [couchbase list username] [couchbase lite password] [database name]

## 5. ドキュメントの作成

    $ ./create_document file [file name] [database name] [json data]
    $ ./create_document [couchbase list username] [couchbase lite password] [database name] '[json data]'

## 6. ドキュメント一覧取得

    $ ./get_all_document file [file name] [database name]"
    $ ./get_all_document [couchbase list username] [couchbase lite password] [database name]"

KEYの一覧を取得するのみです。

## 7. ドキュメントの取得

    $ ./get_document file [file name] [database name] [document id] [query]"
    $ ./get_document [couchbase list username] [couchbase lite password] [database name] [document id] [query]"

## 6. Couchbase Serverとの同期

    $ ./replicate file [file name] [couchbase lite database name] [syncgateway ip] [syncgateway database name]
    $ ./replicate [couchbase list id] [couchbase lite password] [couchbase lite database name] [syncgateway ip] [syncgateway database name]

