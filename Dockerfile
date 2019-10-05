FROM openjdk:8-jre-alpine

RUN mkdir -p /opt/embulk/bin
RUN wget https://dl.embulk.org/embulk-latest.jar -O /opt/embulk/bin/embulk
RUN chmod +x /opt/embulk/bin/embulk
ENV PATH=$PATH:/opt/embulk/bin

RUN apk add libc6-compat 

RUN embulk gem install embulk-filter-column
# RUN embulk gem install embulk-input-jdbc
RUN embulk gem install embulk-input-mysql
RUN embulk gem install embulk-output-mysql

CMD embulk --help
