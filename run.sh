#!/bin/bash
name="";
if [ -n $1 ]
then
    name="xiuhao"
fi
serverUrl="http://baozoubisai.com:2083"
phantomjs spiderman.coffee $name $serverUrl