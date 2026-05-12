FROM jupyter/minimal-notebook:python-3.10

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    default-jdk \
    wget \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/conda/lib/python3.10/site-packages/pyflink/log && \
    chmod -R 777 /opt/conda/lib/python3.10/site-packages/pyflink/log

RUN mkdir -p /opt/flink-jars && \
    wget https://repo.maven.apache.org/maven2/org/apache/flink/flink-sql-connector-kafka/3.0.1-1.17/flink-sql-connector-kafka-3.0.1-1.17.jar -P /opt/flink-jars/ && \
    wget https://jdbc.postgresql.org/download/postgresql-42.6.0.jar -P /opt/flink-jars/ && \
    wget https://repo.maven.apache.org/maven2/org/apache/flink/flink-connector-jdbc/3.1.1-1.17/flink-connector-jdbc-3.1.1-1.17.jar -P /opt/flink-jars/ && \
    chmod -R 777 /opt/flink-jars

ENV JAVA_HOME=/usr/lib/jvm/default-java
ENV PATH="${JAVA_HOME}/bin:${PATH}"

RUN pip install --no-cache-dir \
    kafka-python-ng \
    pandas \
    apache-flink==1.17.1 \
    psycopg2-binary

USER jovyan