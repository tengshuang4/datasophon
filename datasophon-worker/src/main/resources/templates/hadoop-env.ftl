export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export HADOOP_OS_TYPE=${r"${HADOOP_OS_TYPE:-$(uname -s)}"}
case ${r"${HADOOP_OS_TYPE}"} in
  Darwin*)
    export HADOOP_OPTS="${r"${HADOOP_OPTS}"} -Djava.security.krb5.realm= "
    export HADOOP_OPTS="${r"${HADOOP_OPTS}"} -Djava.security.krb5.kdc= "
    export HADOOP_OPTS="${r"${HADOOP_OPTS}"} -Djava.security.krb5.conf= "
  ;;
esac
export HADOOP_PID_DIR=${hadoopHome}/pid
export HDFS_NAMENODE_USER=hdfs
export HDFS_DATANODE_USER=hdfs
export HDFS_JOURNALNODE_USER=hdfs
export HDFS_ZKFC_USER=hdfs
export YARN_RESOURCEMANAGER_USER=yarn
export YARN_NODEMANAGER_USER=yarn
export JAVA_HOME=/data/apps/jdk1.8.0_341
<#list itemList as item>
export ${item.name}=${item.value}
</#list>
export HADOOP_LOG_DIR=${hadoopLogDir}

SH_PATH=${r"$(cd `dirname $0`; pwd)"}

export HADOOP_HEAPSIZE="2048"
export HADOOP_NAMENODE_INIT_HEAPSIZE="-Xms2048m"

export HDFS_NAMENODE_OPTS="$HDFS_NAMENODE_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=27001:${hadoopHome}/jmx/prometheus_config.yml"
export HDFS_NAMENODE_OPTS="-Dhadoop.security.logger=${r"${HADOOP_SECURITY_LOGGER:-INFO,RFAS}"} -Dhdfs.audit.logger=${r"${HDFS_AUDIT_LOGGER:-INFO,RFAAUDIT}"} -server -Xms${namenodeHeapSize}g -Xmx${namenodeHeapSize}g -Xmn2g -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=70 -XX:+CMSParallelRemarkEnabled -XX:CMSMaxAbortablePrecleanTime=1000 -XX:+CMSClassUnloadingEnabled -XX:+DisableExplicitGC -XX:MaxTenuringThreshold=10 -Dcom.sun.management.jmxremote -Xloggc:$HADOOP_LOG_DIR/gc.log -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCDateStamps $HDFS_NAMENODE_OPTS"

export HDFS_DATANODE_OPTS="$HDFS_DATANODE_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=27002:${hadoopHome}/jmx/prometheus_config.yml"
export HDFS_DATANODE_OPTS="-Dhadoop.security.logger=ERROR,RFAS $HDFS_DATANODE_OPTS"
export HDFS_DATANODE_OPTS="-Xms${datanodeHeapSize}g -Xmx${datanodeHeapSize}g -verbose:gc -Xloggc:$HADOOP_LOG_DIR/datanode-gc-%p.log -XX:ErrorFile=$HADOOP_LOG_DIR/dn_err_pid.log -XX:+PrintGCDateStamps -XX:+PrintGCDetails -XX:+HeapDumpOnOutOfMemoryError -XX:ParallelGCThreads=8 -XX:+UseConcMarkSweepGC -XX:CMSInitiatingOccupancyFraction=85 -XX:+UseCMSInitiatingOccupancyOnly -XX:CMSMaxAbortablePrecleanTime=1000 -XX:+CMSClassUnloadingEnabled -XX:MaxDirectMemorySize=1G ${r"${HDFS_DATANODE_OPTS}"}"

export HDFS_JOURNALNODE_OPTS="$HDFS_JOURNALNODE_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=27003:${hadoopHome}/jmx/prometheus_config.yml"

export HDFS_ZKFC_OPTS="$HDFS_ZKFC_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=27004:${hadoopHome}/jmx/prometheus_config.yml"


export YARN_RESOURCEMANAGER_OPTS="$YARN_RESOURCEMANAGER_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=9323:${hadoopHome}/jmx/prometheus_config.yml"

export YARN_NODEMANAGER_OPTS="$YARN_NODEMANAGER_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=9324:${hadoopHome}/jmx/prometheus_config.yml"

export MAPRED_HISTORYSERVER_OPTS="$MAPRED_HISTORYSERVER_OPTS -javaagent:${hadoopHome}/jmx/jmx_prometheus_javaagent-0.16.1.jar=9325:${hadoopHome}/jmx/prometheus_config.yml"

export HADOOP_CLIENT_OPTS="-Xmx${r"${HADOOP_HEAPSIZE}"}m $HADOOP_CLIENT_OPTS"
