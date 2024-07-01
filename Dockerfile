FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk wget maven git -y
WORKDIR /home/user/

RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.43/bin/apache-tomcat-9.0.43.tar.gz
RUN tar -zxvf apache-tomcat-9.0.43.tar.gz
RUN mv apache-tomcat-9.0.43 /opt/tomcat
ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH


RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/user/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /home/user/boxfuse-sample-java-war-hello/target/
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]