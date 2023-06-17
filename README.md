# Dockerコンテナ・CI/CDパイプライン入門
## セットアップ
Makefileのコマンドに`peco`を使用しているので、初回のみインストール
- Cloud9
```
apt install peco
```
- mac(local)
```
brew install peco
```
次のコマンドを使用すると、利用できるコマンドが表示されるので、実行したいコマンドを選択
```
make
```

## makefileで使用しているコマンド
- イメージの作成
```
docker image build -t ctn-cicd-hdon .
```
- イメージをキャッシュを使用せずビルド
```
docker image build --no-cache -t ctn-cicd-hdon .
```
- イメージのビルド確認
```
docker image ls
```
- コンテナの起動
ホスト側が`8080`番ポートを使用して、コンテナ側の`80`番ポートとバインド
コンテナの名前には`local-run`を指定して、イメージにビルド済みの`ctn-cicd-hdon`
```
docker run -p 8080:80 --name local-run ctn-cicd-hdon
```
- Dockerコンテナの起動状況確認
```
docker ps
```
- アプリケーションの稼働確認
```
curl localhost:8080

<!DOCTYPE html>
<html lang=ja>
    <head>
        <meta charset="utf-8">
        <title></title>
    </head>
    <body bgcolor="#002200">
        <h1><font color="#3CB371">コンテナ・CI/CD講座へようこそ!!</font></h1>
        <h3><font color="#3CB371">このページはECS環境で動いています</font></h3>
    </body>
</html>
```
- コンテナへのログイン
```
docker exec -it local-run bash
```
