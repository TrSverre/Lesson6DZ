FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk tomcat9 maven git -y
WORKDIR /home/user/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
WORKDIR /home/user/boxfuse-sample-java-war-hello
RUN mvn package
WORKDIR /home/user/boxfuse-sample-java-war-hello/target/
RUN cp hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]