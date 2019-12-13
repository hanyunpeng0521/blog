# 博客系统 1.0

#因为需要打包成war包，因此必须运行在web容器内，
#不能够像jar包那样

#使用tomcat
FROM tomcat:latest
MAINTAINER pingxin
LABEL app="blog" version="0.0.1" by="pingxin"
WORKDIR /usr/local
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/blog-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

#时区同步
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


#容器启动正常,当然取决于你的war包是否是正常，
#注意 ：war中的127.0.0.1 或者localhost 应该替换成指定的ip或者用link进行链接，否则在容器内127.0.0.1 就是容器本身，将找不到具体的服务会报错。

#构建
#docker build -t pingxin/blog:1.0 .
#运行
# docker run --name blog -p 8080:8080 -d pingxin/blog:1.0


#使用mvn jetty:run,这就需要使用源码，在项目目录下运行
#可以采用同步文件夹的方法，或者使用git等方法

#FROM maven:3.6.3-jdk-8-slim
#MAINTAINER pingxin
#LABEL app="blog" version="0.0.1" by="pingxin"
