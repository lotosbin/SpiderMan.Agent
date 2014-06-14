#!/bin/bash
name="";
if [ -n $1 ]
then
    name="xiuhao"
fi
serverUrl="http://baozoubisai.com:2083"
phantomjs spiderman.coffee $name $serverUrl
# http://stackoverflow.com/questions/8778513/how-can-i-setup-run-phantomjs-on-ubuntu 手动安装