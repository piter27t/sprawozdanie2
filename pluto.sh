#!/bin/sh
(date ; free -m -w) >> /logi/info.log
echo $(cat /logi/info.log)