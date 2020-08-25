n_context=$1 #20

UD_directory=selectedUDT-v2.1 # origianl data sources
languages="English Arabic Turkish Spanish Indonesian" # list of languages to process

for lang in ${languages}
do
    targetDir=../data-full/${lang}-trigram-${n_context}-context
    mkdir -p ${targetDir}

    python3 format-trigramall.py $UD_directory/UD_${lang}/train ${lang} train  ${n_context}
    mv train-* ${targetDir}/.

    python3 format-trigramall.py $UD_directory/UD_${lang}/dev ${lang} dev  ${n_context}
    mv dev-* ${targetDir}/.

    python3 format-trigramall.py $UD_directory/UD_${lang}/test ${lang} test  ${n_context}
    mv test-* ${targetDir}/.

    targetDir=../data-lite/${lang}-trigram-${n_context}-context-lite
    mkdir -p ${targetDir}

    python3 format-trigramall.py $UD_directory/UD_${lang}/train ${lang} train  ${n_context} 10
    mv train-* ${targetDir}/.

    python3 format-trigramall.py $UD_directory/UD_${lang}/dev ${lang} dev  ${n_context} 3
    mv dev-* ${targetDir}/.

    python3 format-trigramall.py $UD_directory/UD_${lang}/test ${lang} test  ${n_context}
    mv test-* ${targetDir}/.
done

