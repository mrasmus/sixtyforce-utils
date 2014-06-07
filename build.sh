rm -f bin/*
for FILE in `ls as/`
do
    NAME=`echo $FILE | cut -d'.' -f1`.scpt
    osacompile -o bin/$NAME as/$FILE
done
echo Scripts compiled to bin directory.
