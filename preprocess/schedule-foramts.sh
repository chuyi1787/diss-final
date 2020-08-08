cd representation

unzip -o -d ./ selectedUDT-v2.1.zip
unzip -o -d ./ morfessor-models.zip

sh format-bpe.sh 100 20
sh format-bpe.sh 500 20
sh format-bpe.sh 1000 20
sh format-bpe.sh 3000 20
sh format-bpe.sh 5000 20

sh format-bpeall.sh 100 20
sh format-bpeall.sh 500 20
sh format-bpeall.sh 1000 20
sh format-bpeall.sh 3000 20
sh format-bpeall.sh 5000 20

#sh format-char.sh 20
#sh format-morfessor.sh 20
#sh format-morfessorall.sh 20
#sh format-trigram.sh 20
