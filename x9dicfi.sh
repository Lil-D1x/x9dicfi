#!/bin/bash
if [ "$1" == "" ]
then
echo "Recon Web (Files and Directory) - L1l D1x "
echo "$0 target.com wordlist.txt"
else
for dir in $(cat $2);do
respdir=$(curl -s -o /dev/null -w "%{http_code}" $1/$dir/)
if [ $respdir == "200" ]
then
echo "	####################################################"
echo "	Directory found:$1/$dir/"
fi
done
for file in $(cat $2);do
respfile=$(curl -s -o /dev/null -w "%{http_code}" $1/$file)
if [ $respfile == "200" ]
then
echo "	####################################################"
echo "	File found:$1/$file"
fi
done
fi

