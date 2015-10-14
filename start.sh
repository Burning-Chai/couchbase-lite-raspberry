#!/bin/bash

FILE=cbl.jar
DEAMON="java -jar ${FILE}"

if [ -e ${FILE} ]; then
  PID=`ps aux | grep "${DEAMON}" | grep -v "grep" | awk '{print $2}'`
  if [ -n "${PID}" ]; then
    echo "'${DEAMON}' already run."
        exit 1
  else
    rm -f nohup.out
    nohup java -jar ${FILE} &
  fi
else
  echo "${FILE} is not exists."
  exit 1
fi

