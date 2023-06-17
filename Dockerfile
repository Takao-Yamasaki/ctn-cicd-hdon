FROM ubuntu:18.04

# 最新のパッケージ情報を取得して、apacheをインストール
RUN apt-get update && \
    apt-get -y install apache2

COPY src/ /var/www/html/
COPY run_apache.sh /root/

# run_apache.sh実行権限を付与
RUN chmod 755 /root/run_apache.sh

# 80番ポートの公開を明示的に宣言
EXPOSE 80

CMD /root/run_apache.sh
