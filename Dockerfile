FROM tomee

WORKDIR /usr/local/tomee

COPY /target/busticket-1.0-SNAPSHOT.war /usr/local/tomee/webapps
