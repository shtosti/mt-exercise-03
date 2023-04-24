# # Define the paths
# scripts=$(dirname "$0")
# base=$scripts/..
# data=$base/data/office
# models=$data/models
# 
# echo "Using data path: $(realpath $data)"
# 
# # Create the necessary directories
# mkdir -p $models
# 
# # Set the number of threads and device
# num_threads=$(sysctl -n hw.physicalcpu)
# device="0" # Change this to select the GPU device
# 
# # Start the timer
# SECONDS=0
# 
# # Run the training
# (cd $base/tools/pytorch-examples/word_language_model &&
#     CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python main.py --data $data \
#         --epochs 40 \
#         --log-interval 100 \
#         --emsize 200 --nhid 200 --dropout 0.5 --tied \
#         --mps \
#         --save $models/model.pt
# )
# 
# # Print the time taken
# echo "Time taken:"
# echo "$SECONDS seconds"



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
        --epochs 40 \
        --log-interval 100 \
        --emsize 200 --nhid 200 --dropout 0.5 --tied \
        --save $models/model.pt
)

echo "time taken:"
echo "$SECONDS seconds"