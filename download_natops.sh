#!/bin/bash
SVR_ADDR="http://groups.csail.mit.edu/mug/natops/archive/"

DIR="$( cd "$(dirname "$0")" ; pwd -P )"
OUT_DIR=${DIR}/data
cd $DIR

if [ ! -d ${OUT_DIR} ]; then
  mkdir ${OUT_DIR}
fi

wget ${SVR_ADDR}/precomputed_features.zip -P ${OUT_DIR}
wget ${SVR_ADDR}/segmentation.txt -P ${OUT_DIR}

for i in $(seq -f "%02g" 1 24); do
  wget ${SVR_ADDR}/gesture${i}.zip -P ${OUT_DIR}
done

for i in $(seq -f "%02g" 1 24); do
  unzip ${OUT_DIR}/gesture${i}.zip -d ${OUT_DIR}
done
