export KYUUBI_HOME=/data/apps/kyuubi
export SPARK_HOME=/data/apps/spark3
export PYSPARK_ALLOW_INSECURE_GATEWAY=1
export HIVE_HOME=/data/apps/hive
export KAFKA_HOME=/data/apps/kafka
export HBASE_HOME=/data/apps/hbase
export HBASE_PID_PATH_MK=/data/apps/hbase/pid
export FLINK_HOME=/data/apps/flink
export HADOOP_HOME=/data/apps/hadoop
export HADOOP_CONF_DIR=/data/apps/hadoop/etc/hadoop
export PATH=$PATH:$SPARK_HOME/bin:$HADOOP_HOME/bin:$HIVE_HOME/bin:$FLINK_HOME/bin:$KAFKA_HOME/bin:$HBASE_HOME/bin:$KYUUBI_HOME/bin
export HADOOP_CLASSPATH=`hadoop classpath`

