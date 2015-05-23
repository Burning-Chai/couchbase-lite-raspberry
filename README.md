# couchbase-lite-sample

## 1. couchbase lite 起動
```
$ java -cp couchbase-lite-local-latest.jar JarMain
```
ここでID/PASSWORDが表示されます。後で使いますので、覚えておきましょう。

## 2. database の作成
sh/ 配下の create_databaase を使用します。
```
$ ./create_database CouchbaseLiteId CouchbaseLitePassword CouchbaseLiteDatabaseName
```
* CouchbaseLiteId ... 起動時に表示されたID
* CouchbaseLitePassword ... 起動時に表示されたパスワード
* CouchbaseLiteDatabasName ... 任意の名前(データベース名となります)

## 3. database の取得
```
$ ./get_database CouchbaseLiteId CouchbaseLitePassword CouchbaseLiteDatabaseName
```
* CouchbaseLiteId ... 起動時に表示されたID
* CouchbaseLitePassword ... 起動時に表示されたパスワード
* CouchbaseLiteDatabasName ... 2で指定したデータベース名

## 4. ドキュメントの作成
```
$ ./create_document CouchbaseLiteId CouchbaseLitePassword CouchbaseLiteDatabaseName 'JsonData'
```
* CouchbaseLiteId ... 起動時に表示されたID
* CouchbaseLitePassword ... 起動時に表示されたパスワード
* CouchbaseLiteDatabasName ... 2で指定したデータベース名
* JsonData ... JSONデータ

## 5. ドキュメント一覧取得
```
$ ./get_all_document  CouchbaseLiteId CouchbaseLitePassword CouchbaseLiteDatabaseName
```
* CouchbaseLiteId ... 起動時に表示されたID
* CouchbaseLitePassword ... 起動時に表示されたパスワード
* CouchbaseLiteDatabasName ... 2で指定したデータベース名
※KEYの一覧を取得するのみです。

## 6. Couchbase Server との同期
```
$ ./replicate  CouchbaseLiteId CouchbaseLitePassword CouchbaseLiteDatabaseName SyncGatewayIP SyncGateWayDatabaseName
```
* CouchbaseLiteId ... 起動時に表示されたID
* CouchbaseLitePassword ... 起動時に表示されたパスワード
* CouchbaseLiteDatabasName ... 2で指定したデータベース名
* SyncGatewayIP ... SyncGateWayが起動しているサーバのIP(ポート番号付き)
* SyncGateWayDatabaseName ... SyncGateWayで用意しているデータベース名

--------

実際に動作した手順は sh/exec_ample.txt に書いてあります。

ID/PASS 等を変更して、やってみてください。

