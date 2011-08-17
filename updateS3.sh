#!/bin/bash

echo "#include" > user-data

files=("appserver-init" "server-setup" "nginx" "uwsgi")
for file in "${files[@]}"
do
  s3cmd put --acl-public $file s3://mateolargo/cloudinit/$file
  echo "https://mateolargo.s3.amazonaws.com/cloudinit/$file" >> user-data
done
