# couchbase-lite-sample

このリポジトリは[https://github.com/couchbaselabs/couchbase-lite-local](https://github.com/couchbaselabs/couchbase-lite-local)の内容を少々修正したものになります。

変更点と共に作成したシェルの説明を行います。

# 変更点

**１. 内部で使用しているjarのバージョンアップ**

2015/04/24時点でSync GatewayとのReplicateを行うことができませんでした。そこで、内部で使用しているjarのバージョンを上げたところReplicateが無事動作しました。

**２. Couchbase Liteのusernameとpasswordをファイル出力**

Couchbase Liteを起動した際にusernameとpasswordを標準出力します。それらを標準出力だけでなく、ファイルにも出力するようにしました。

**３．強制終了コマンドを受け付けない**

    trap("SIGINT") { exit! }

を削除

**４．標準入力を待ち続けない**

    loop do
      puts "Press Ctrl-C to shutdown"
      STDIN.gets
    end

を

    loop do
    end
    
に変更

# jarの作成の仕方
上記の変更を行いましたので、再度jarを作成しました。

    $ jar cfm cbl.jar ./META-INF/MANIFEST.MF JarMain.class META-INF/ couchbase-lite-local

# 作成したシェルについて
shディレクトリ配下にあります。

## 1. couchbase lite 起動

    $ nohup java -jar cbl.jar &

今回の修正でcouchbase_lite_info.txtにusernameとpasswordが出力されます。

## パラメータについて
 * file_name ... 起動時に作成されたファイルへのパス
 * couchbase_lite_username ... CouchbaseLite認証時のユーザネーム
 * couchbase_lite_passwoed ... CouchbaseLite認証時のパスワード
 * couchbase_lite_database_name ... CouchbaseLite上のデータベース名
 * document_id ... ドキュメントのID
 * json_data ... JSONデータ
 * query ... ドキュメント取得時の詳細パラメータ([参照](http://developer.couchbase.com/mobile/develop/references/couchbase-lite/rest-api/local-document/get---db--local--local-doc-/index.html))
 * syncgateway_ip ... SyncGatewayが起動しているサーバのIP(ポート番号付き)
 * syncgateway_database_name ... SyncGatewayで用意しているデータベース名

## 2. データベースの作成

    $ ./create_database file [file_name] [couchbase_lite_database_name]
    $ ./create_database [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name]

## 3. データベースの取得

    $ ./get_database file [file_name] [couchbase_lite_database_name]
    $ ./get_database [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name]

## 4. データベースの削除

    $ ./delete_database file [file_name] [couchbase_lite_database_name]
    $ ./delete_database [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name]

## 5. ドキュメントの作成

    $ ./create_document file [file_name] [couchbase_lite_database_name] [json_data]
    $ ./create_document [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name] '[json_data]'

## 6. ドキュメント一覧取得

    $ ./get_all_document file [file_name] [couchbase_lite_database_name]
    $ ./get_all_document [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name]

KEYの一覧を取得するのみです。

## 7. ドキュメントの取得

    $ ./get_document file [file_name] [couchbase_lite_database_name] [document_id] [query]
    $ ./get_document [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name] [document_id] [query]

## 8. Couchbase Serverとの同期

    $ ./replicate file [file_name] [couchbase_lite_database_name] [syncgateway_ip] [syncgateway_databse_name]
    $ ./replicate [couchbase_list_username] [couchbase_lite_password] [couchbase_lite_database_name] [syncgateway_ip] [syncgateway_databse_name]

