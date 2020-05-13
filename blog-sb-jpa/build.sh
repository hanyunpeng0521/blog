name=blog
version=latest
mvn clean compile package -Dmaven.test.skip=true && docker build -t pingxin/${name}:${version} .
#
#docker push pingxin/${name}:${version}
#运行
#docker run --name blog --network px_net --link mysql:data_mysql -p8024:8080 -d pingxin/blog:latest