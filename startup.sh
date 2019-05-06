#!/bin/sh

set -e

. /etc/default/apacheds

exec ${JAVA_HOME}/bin/java ${JAVA_OPTS} \
            -Dapacheds.controls="${ADS_CONTROLS}" \
            -Dapacheds.extendedOperations="${ADS_EXTENDED_OPERATIONS}" \
            -Dlog4j.configuration="file:${ADS_INSTANCES}/${ADS_INSTANCE}/conf/log4j.properties" \
            -Dapacheds.log.dir="${ADS_INSTANCES}/${ADS_INSTANCE}/log" \
            -cp "${ADS_HOME}/lib/*" \
            org.apache.directory.server.UberjarMain \
            "${ADS_INSTANCES}/${ADS_INSTANCE}/"

