#!/bin/sh

 HOST=http://localhost:9331


curl -X POST $HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "failed",
      "ref": "master"
   },
   "user":{
      "username": "pending"
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
      "username": "running"
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
      "username": "success"
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
      "username": "failed"
   },
   "project":{
      "name": "wcm-comments"
   }
}'
