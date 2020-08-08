#!/bin/bash

types= "100-bpe-20-context
        500-bpe-20-context
        1000-bpe-20-context
        3000-bpe-20-context
        5000-bpe-20-context
        char-20-context
        trigram-20-context
        morfessor-20-context
        morfessorall-20-context"

languages="English Arabic Turkish Spanish Indonesian"

for type in ${types}
do
echo $type

  for lang in ${languages}
  do
  echo ${lang}-${type}

  mkdir -p $data-lite/${lang}-${type}/data-pp/
  mkdir -p $data-full/${lang}-${type}/data-pp/

  echo "Starting dp"
  onmt_preprocess \
    -train_src data-lite/${lang}-${type}-lite/train-sources\
    -train_tgt data-lite/${lang}-${type}-lite/train-targets \
    -valid_src data-lite/${lang}-${type}-lite/dev-sources \
    -valid_tgt data-lite/${lang}-${type}-lite/dev-targets \
    -src_seq_length 75 \
    -tgt_seq_length 75 \
    -save_data data-lite/${lang}-${type}-lite/data-pp/${lang}-${type}-lite

  onmt_preprocess \
    -train_src data-full/${lang}-${type}/train-sources\
    -train_tgt data-full/${lang}-${type}/train-targets \
    -valid_src data-full/${lang}-${type}/dev-sources \
    -valid_tgt data-full/${lang}-${type}/dev-targets \
    -src_seq_length 75 \
    -tgt_seq_length 75 \
    -save_data data-full/${lang}-${type}/data-pp/${lang}-${type}
  echo "End of dp"

  done

done