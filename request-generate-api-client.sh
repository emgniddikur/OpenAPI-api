#!/bin/bash

cd ~/project

readonly changed_schema=`git diff HEAD^ --name-only swagger.yml`

if [ "${changed_schema}" != "" ]; then
  curl -u ${OPEN_API_CLIENT2_TOKEN}: -d build_parameters[CIRCLE_JOB]=create-api-client-pr \
  https://circleci.com/api/v1.1/project/github/emgniddikur/OpenAPI-client2/tree/develop
fi
