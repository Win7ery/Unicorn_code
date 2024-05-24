#!/bin/bash

# 设置变量
# file_name=$1
filetype="edgelist"
niters=10000
# n从1到51
for n in {1..51}
do
    base="../data/parsers_data/base/base_${n}"
    stream="../data/parsers_data/stream/stream_${n}"
    sketch="../data/sketch/parsers_data_${n}"
    # 执行命令
    bin/unicorn/main filetype $filetype niters $niters base $base stream $stream sketch $sketch
done