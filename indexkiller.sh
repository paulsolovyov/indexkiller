#!/bin/bash
# This script will kill Indexing process which is running for more than 2.5 hours

(PIDS="`ps aux | grep "group=index" | awk '{print $2}'`"

for i in ${PIDS};
do
{
    time="`ps -p $i -o etimes= | awk '{print $1}'`";

    now=$(date +"%T");

    echo "trying to kill $i";

    if [[ $time -gt 9000 ]] ; then ## 9000 = 2.5 hours
        echo "---------------------------";
        echo "Killing $i";
        echo "Process running for $time";
        echo "Current time : $now";
        kill -9 $i; ## kills the process
    fi
}
done;)|tee -a "/var/www/php/var/log/indexkiller.log" ## adjust the logging file location