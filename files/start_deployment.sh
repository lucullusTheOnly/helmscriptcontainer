#!/bin/bash

GIT_USERNAME_ENCODED="$(urlencode.py ${GIT_USERNAME})"
GIT_PASSWORD_ENCODED="$(urlencode.py ${GIT_PASSWORD})"
echo "${GIT_USERNAME_ENCODED}:${GIT_PASSWORD_ENCODED}"

git -C /home/deployment/ clone "https://${GIT_USERNAME_ENCODED}:${GIT_TOKEN_ENCODED}@${GIT_REPO}" sourcerepo

chmod +x /home/deployment/sourcerepo/${SCRIPT_PATH}
/home/deployment/sourcerepo/${SCRIPT_PATH}
