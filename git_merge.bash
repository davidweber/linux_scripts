#!/bin/bash
#
# @file   git_merge.bash
# @author David Weber <dweber@oxefit.com>
# @date   07/30/2025
#
# @brief merge FROM branch into TO branch
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

if [ $# -ne 2 ]; then
  BASENAME=`basename ${0}`
  echo "Usage: ${BASENAME} <from branch> <to branch>"
  exit -1
fi

FROM=${1}
TO=${2}

if [ ! -d "./.git" ]; then
  echo "error: not .git directory found"
  exit -2
fi

git checkout ${FROM}
if [ $? -ne 0 ]; then
  echo "error: checkout of branch \"${FROM}\" failed"
  exit -3
fi

git checkout ${TO}
read -p "Ok to merge ${FROM} to ${TO}? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit -2
git merge ${FROM}

