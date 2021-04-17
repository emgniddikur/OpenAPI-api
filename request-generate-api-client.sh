#!/bin/bash

readonly changed_schema=`git diff HEAD^ HEAD --name-only swagger.yml`

if [ "${CIRCLE_BRANCH}" = "develop" -a "${changed_schema_definition_file}" != "" ]; then
  curl -u ${OPEN_API_CLIENT_TOKEN}: -d build_parameters[CIRCLE_JOB]=create-api-client-pr \
  https://circleci.com/api/v1.1/project/github/emgniddikur/OpenAPI-client/tree/develop
fi
