# MIT License

# Copyright (c) 2018 Gang Liao <gangliao@cs.umd.edu>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

cmake_minimum_required(VERSION 3.0 FATAL_ERROR)

project(freeflow-router VERSION 0.1.0)

find_package(CURL       REQUIRED)
find_package(Threads    REQUIRED)

set(FFROUTER_SOURCE_DIR   ${CMAKE_CURRENT_SOURCE_DIR})
set(FFROUTER_BINARY_DIR   ${CMAKE_CURRENT_BINARY_DIR})

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/bazel.cmake/cmake)
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)


include(bazel)
include(jsoncpp)
include(curl)
include(base64)


cc_binary(router
          SRCS main.cpp ffrouter.cpp rdma_api.cpp verbs_cmd.cpp shared_memory.cpp
          DEPS glog curl jsoncpp gflags base64)
target_link_libraries(router -L/usr/lib rdmacm ibverbs)

cc_test(etcd_test SRCS etcd_test.cpp DEPS jsoncpp glog curl base64)
cc_test(base64_test SRCS base64_test.cpp DEPS base64)
