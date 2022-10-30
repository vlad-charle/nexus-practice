#!/bin/bash
if [[ $# -ne 2 ]]
then
	echo "Please, provide username and password as arguments"
	echo "$0 <username> <password>"
	exit 1
fi
username=$1
password=$2
artifactLink=$(curl -u $username:$password -X GET 'http://0.0.0.0:8081/service/rest/v1/components?repository=maven-repo-2&sort=version' | jq '.items[].assets[].downloadUrl' --raw-output | grep ".jar$")
wget --http-user $username --http-password $password $artifactLink
app=$(ls)
java -jar $app