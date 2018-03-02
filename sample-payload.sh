#!/bin/sh

HOST=localhost:9331
# HOST=app2-preprod:9331

curl -X POST http://$HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "failed",
      "ref": "master"
   },
   "user":{
      "username": "iprice"
   },
   "project":{
      "name": "wcm-comments"
   }
}'

curl -X POST http://$HOST/pipeline-events \
  -H "X-Gitlab-Event: Build Hook" \
  -H "Content-Type: application/json" \
  -d '{
   "object_attributes":{
      "status": "success",
      "ref": "master"
   },
   "user":{
      "username": "iprice"
   },
   "project":{
      "name": "wcm-comments"
   }
}'
