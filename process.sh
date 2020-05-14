#!/bin/bash
export HOME_ICTUS=""

export CTAKES_HOME=$HOME_ICTUS/ICTUSnet/ctakes-SpaCTeS
export TXT=$HOME_ICTUS/ICTUSnet/data/TXT
export ANN_VARIABLE=$HOME_ICTUS/ICTUSnet/data/ANN_VARIABLE
export ANN_SECTION=$HOME_ICTUS/ICTUSnet/data/ANN_SECTION
export ANN_FINAL=$HOME_ICTUS/ICTUSnet/data/ANN_FINAL
export HEADERDETECTOR=$HOME_ICTUS/ICTUSnet/HeaderDetector
export BRATMERGER=$HOME_ICTUS/ICTUSnet/BratMerger
echo "Detecting Variables ..."
java -Djava.library.path=/usr/local/share/freeling/APIs/java -cp $CTAKES_HOME/lib/*:$CTAKES_HOME/ctakes-SpaCTeS-4.0.1-SNAPSHOT.jar -Dlog4j.configuration=file:$CTAKES_HOME/config/log4j.xml -Xmx8g  org.apache.ctakes.spactes.pipeline.SpaCTeSBuilderRunner $TXT $ANN_VARIABLE

echo "Detecting Sections ..."
python3 $HEADERDETECTOR/scripts/header_detector.py --data $TXT

echo "Merging Variables and Sections ..."
python3 $BRATMERGER/script/merger.py --data $ANN_SECTION

