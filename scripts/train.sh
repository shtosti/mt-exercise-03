
#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools
models=$data/models

echo "Using data path: $(realpath $data)"

mkdir -p $models

num_threads=4
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data/office \
        --epochs 3 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.1 --tied \
        --save $models/model_drop_01.pt 
)

echo "time taken:"
echo "$SECONDS seconds"