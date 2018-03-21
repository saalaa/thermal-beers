#!/bin/sh

HOST=http://localhost:9331


curl -X POST $HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "pending",
      "ref": "master"
   },
   "user":{
      "username": "bmyard"
   },
   "project":{
      "name": "wcm-comments"
   }
}'

curl -X POST $HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "running",
      "ref": "master"
   },
   "user":{
      "username": "bmyard"
   },
   "project":{
      "name": "wcm-comments"
   }
}'

curl -X POST $HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "success",
      "ref": "master"
   },
   "user":{
      "username": "bmyard"
   },
   "project":{
      "name": "wcm-comments"
   }
}'

curl -X POST $HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "failed",
      "ref": "master"
   },
   "user":{
      "username": "bmyard"
   },
   "project":{
      "name": "wcm-comments"
   }
}'
