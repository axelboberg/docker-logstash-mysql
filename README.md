# docker-logstash-mysql
A Docker image with Logstash and the jdbc-plugin for MySQL, defaulting to Elasticsearch output

## Configure

### Environment variables
The environment variables are 1:1 mappings to keys in the logstash.conf file

```
LOGSTASH_JDBC_CONNECTION_STRING
LOGSTASH_JDBC_USER
LOGSTASH_JDBC_PASSWORD
LOGSTASH_JDBC_STATEMENT
LOGSTASH_JDBC_SCHEDULE
LOGSTASH_ELASTICSEARCH_HOSTS
LOGSTASH_ELASTICSEARCH_INDEX
LOGSTASH_ELASTICSEARCH_DOCUMENT_ID
```

### logstash.conf
As an alternative to using environment variables the file `logstash.conf` could be bind-mounted to `/usr/share/logstash/pipeline/logstash.conf`.

Example syntax for `docker-compose.yml`

```
volumes:
  - type: bind
    source: ./logstash.conf
    target: /usr/share/logstash/pipeline/logstash.conf
```

## Run

### docker-compose.yml
```
version: '3.7'
services:
  logstash:
    image: axelboberg/logstash-mysql
    environment:
      - "LOGSTASH_JDBC_CONNECTION_STRING="
      - "LOGSTASH_JDBC_USER="
      - "LOGSTASH_JDBC_PASSWORD="
      - "LOGSTASH_JDBC_STATEMENT="
      - "LOGSTASH_JDBC_SCHEDULE="
      - "LOGSTASH_ELASTICSEARCH_HOSTS="
      - "LOGSTASH_ELASTICSEARCH_INDEX="
      - "LOGSTASH_ELASTICSEARCH_DOCUMENT_ID="
```