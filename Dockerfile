FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk tomcat9 maven git -y
CMD ["/usr/share/tomcat9/bin/catalina.sh", "run"]