FROM docker.elastic.co/logstash/logstash:6.8.3

# Install JDBC-driver
RUN bin/logstash-plugin install logstash-input-jdbc

# Copy driver
COPY ./mysql-connector-java-5.1.48-bin.jar logstash-core/lib/jars/mysql-connector-java-5.1.48-bin.jar

# Copy options
COPY ./logstash.conf /usr/share/logstash/pipeline/logstash.conf
COPY ./logstash.yml /usr/share/logstash/config/logstash.yml