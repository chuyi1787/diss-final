merge_N=$1 #500
n_context=$2 #20

UD_directory=selectedUDT-v2.1 # origianl data sources
languages="English Arabic Turkish Spanish Indonesian" # list of languages to process

for lang in ${languages}
do
    echo $lang
    targetDir=../data-full/${lang}-${merge_N}-bpe-${n_context}-context
    mkdir -p ${targetDir}

    python3 format-bpe.py $UD_directory/UD_${lang}/train ${lang} train ${merge_N} ${n_context}
    mv train-* ${targetDir}/.

    python3 format-bpe.py $UD_directory/UD_${lang}/dev ${lang} dev ${merge_N} ${n_context}
    mv dev-* ${targetDir}/.

    python3 format-bpe.py $UD_directory/UD_${lang}/test ${lang} test ${merge_N} ${n_context}
    mv test-* ${targetDir}/.

    # for lite
    targetDir2=../data-lite/${lang}-${merge_N}-bpe-${n_context}-context-lite
    mkdir -p ${targetDir2}

    python3 format-bpe.py $UD_directory/UD_${lang}/train ${lang} train ${merge_N} ${n_context} 10
    mv train-* ${targetDir2}/.

    python3 format-bpe.py $UD_directory/UD_${lang}/dev ${lang} dev ${merge_N} ${n_context} 3
    mv dev-* ${targetDir2}/.

    python3 format-bpe.py $UD_directory/UD_${lang}/test ${lang} test ${merge_N} ${n_context}
    mv test-* ${targetDir2}/.
done

