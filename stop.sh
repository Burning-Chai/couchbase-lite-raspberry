#!/bin/bash

DEAMON="java -jar cbl.jar"

PID=`ps aux | grep "${DEAMON}" | grep -v "grep" | awk '{print $2}'`
if [ -n "${PID}" ]; then
  echo "'${DEAMON}' stop now."
  kill -9 ${PID}
else
  echo "'${DEAMON}' already stop."
fi

