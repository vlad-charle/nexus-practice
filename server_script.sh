#!/bin/bash
artifactLink=$(curl -u server:12345678 -X GET 'http://0.0.0.0:8081/service/rest/v1/components?repository=maven-repo-2&sort=version' | jq '.items[].assets[].downloadUrl' --raw-output | grep ".jar$")
wget --http-user server --http-password 12345678 $artifactLink
app=$(ls)
java -jar $app