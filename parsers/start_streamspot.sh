#!/bin/bash
# gid=$1
# python3 streamspot/parse_fast.py -g ${gid} -i ../data/streamspot.tsv -b ../data/parsers_data/base/base_${gid} -S ../data/parsers_data/stream/stream_${gid} -a

# fast run
for gid in {500..550}
do
    python3 streamspot/parse_fast.py -g ${gid} -i ../data/streamspot.tsv -b ../data/parsers_data/base/base_${gid} -S ../data/parsers_data/stream/stream_${gid} -a
done