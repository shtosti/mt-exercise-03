# #! /bin/bash
# 
# scripts=$(dirname "$0")
# base=$scripts/..
# 
# data=$base/data
# 
# mkdir -p $data
# 
# # path to your data file
# office_data=/Users/shtosti/mt-exercise-03/office_data.txt
# 
# # preprocess slightly
# cat $office_data | python $base/scripts/preprocess_raw_mine.py > $data/office_data.cleaned.txt
# 
# # tokenize, fix vocabulary upper bound
# cat $data/office_data.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
#     $data/office_data.preprocessed.txt
# 
# 
# 
# # split
# total_lines=$(wc -l < $data/office_data.preprocessed.txt)
# 
# train_lines=$((total_lines * 8 / 10))
# valid_lines=$((total_lines * 1 / 10))
# test_lines=$((total_lines * 1 / 10))
# 
# head -$((train_lines)) $data/office_data.preprocessed.txt > $data/office_train.txt
# tail -n +$((train_lines+1)) $data/office_data.preprocessed.txt | head -$((valid_lines)) > $data/office_valid.txt
# tail -n +$((train_lines+valid_lines+1)) $data/office_data.preprocessed.txt | head -$((test_lines)) > $data/office_test.txt



#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data

mkdir -p $data/office/raw
mkdir -p $data/office

# path to your data file
office_data=/Users/shtosti/mt-exercise-03/office_data.txt

# preprocess slightly
cat $office_data | python $base/scripts/preprocess_raw_mine.py > $data/office/raw/office_data.cleaned.txt

# tokenize, fix vocabulary upper bound
cat $data/office/raw/office_data.cleaned.txt | python $base/scripts/preprocess.py --vocab-size 5000 --tokenize --lang "en" --sent-tokenize > \
    $data/office/raw/office_data.preprocessed.txt

# split
total_lines=$(wc -l < $data/office/raw/office_data.preprocessed.txt)

train_lines=$((total_lines * 8 / 10))
valid_lines=$((total_lines * 1 / 10))
test_lines=$((total_lines * 1 / 10))

head -$((train_lines)) $data/office/raw/office_data.preprocessed.txt > $data/office/train.txt
tail -n +$((train_lines+1)) $data/office/raw/office_data.preprocessed.txt | head -$((valid_lines)) > $data/office/valid.txt
tail -n +$((train_lines+valid_lines+1)) $data/office/raw/office_data.preprocessed.txt | head -$((test_lines)) > $data/office/test.txt

