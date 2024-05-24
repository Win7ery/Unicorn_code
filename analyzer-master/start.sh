#!/bin/bash

# 设置变量
# file_name=$1
n=$1
filetype="edgelist"
niters=100000
# base="../data/${file_name}/base_train/base-gmail-v2-${n}.txt"
# stream="../data/${file_name}/stream_train/base-gmail-v2-${n}.txt"
# sketch="../data/sketch/${file_name}_${n}"

base="../data/parsers_data/base/base_${n}"
stream="../data/parsers_data/stream/stream_${n}"
sketch="../data/sketch/parsers_data_${n}"

# 执行命令
bin/unicorn/main filetype $filetype niters $niters base $base stream $stream sketch $sketch