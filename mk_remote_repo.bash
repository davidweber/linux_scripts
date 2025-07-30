#!/bin/bash
#
# @file   mk_remote_repo.bash
# @author David Weber <dweber@oxefit.com>
# @date   07/30/2025
#
# @brief mk_remote_repo module implementation
#
# Copyright © 2021-2025 David Weber
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

if [ $# -ne 1 ]; then
  BASENAME=`basename ${0}`
  echo "Usage: ${BASENAME} <remote repo name>"
  exit -1
fi

NEW_REPO=${1}

mkdir ${NEW_REPO}
cd ${NEW_REPO}
echo "# ${NEW_REPO}" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M master
gh repo create --private --push --source ${PWD}
#Hgit remote add origin git@github.com:davidweber/${NEW_REPO}.git
#git push -u origin master

#git checkout -b ${NEW_BRANCH}
#read -p "Push new branch ${NEW_BRANCH} to remote repo? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit -2
#git push -u origin ${NEW_BRANCH}

