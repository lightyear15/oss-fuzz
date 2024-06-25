#!/bin/bash -eu
# Copyright 2024 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
################################################################################

# build project
# e.g.

mv _cmake cmake
mv _CMakeLists.txt CMakeLists.txt
mv src/_CMakeLists.txt src/CMakeLists.txt
mv src/ctest/_CMakeLists.txt src/ctest/CMakeLists.txt
cmake -B build -S . \
    -DBUILD_SHARED_LIBS:BOOL=FALSE \
    -DCMAKE_BUILD_TYPE:STRING=Debug \
    -DWALLYCORE_ENABLE_TESTS:BOOL=TRUE \
    -DWALLYCORE_ENABLE_FUZZY:BOOL=TRUE

cmake --build build --parallel 4

mv ./build/src/ctest/*fuzzer $OUT/
