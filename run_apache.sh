# 環境変数を設定するためのスクリプトファイル`envvars`を読み込み
. /etc/apache2/envvars

# /var/run/apache2ディレクトリを作成(PIDファイルなどを格納)
mkdir -p /var/run/apache2

# /var/lock/apache2ディレクトリを作成（ロックファイルなどを格納）
mkdir -p /var/lock/apache2

# Apacheをバックグラウンドで起動
/usr/sbin/apache2 -D FOREGROUND
