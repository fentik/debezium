#!/bin/bash

set -eux

mvn verify -Dquick

POSTGRES_DIR="/opt/kafka/connect/debezium-connector-postgres"
cp ./debezium-connector-postgres/target/debezium-connector-postgres-2.0.1.Final.jar \
   ./debezium-api/target/debezium-api-2.0.1.Final.jar \
   ./debezium-core/target/debezium-core-2.0.1.Final.jar \
   ./debezium-connector-postgres/target/generated-sources/postgres.json \
   $POSTGRES_DIR/
cp ./debezium-server/debezium-server-redis/target/quarkus-app/lib/main/org.postgresql.postgresql-42.5.0.jar $POSTGRES_DIR/postgresql-42.5.0.jar
cp ./debezium-server/debezium-server-redis/target/quarkus-app/lib/main/com.google.protobuf.protobuf-java-3.19.6.jar $POSTGRES_DIR/protobuf-java-3.19.6.jar
