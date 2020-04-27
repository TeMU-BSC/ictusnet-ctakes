#!/bin/bash

export CTAKES_HOME=/ICTUSnet/ctakes-SpaCTeS

export TXT=/ICTUSnet/data/TXT
export ANN_VARIABLE=/ICTUSnet/data/ANN_VARIABLE
export ANN_SECTION=/ICTUSnet/data/ANN_SECTION
export ANN_FINAL=/ICTUSnet/data/ANN_FINAL

echo "Running pipeline for detecting Variables"
java -Djava.library.path=/usr/local/share/freeling/APIs/java -cp $CTAKES_HOME/lib/*:$CTAKES_HOME/ctakes-SpaCTeS-4.0.1-SNAPSHOT.jar -Dlog4j.configuration=file:$CTAKES_HOME/config/log4j.xml -Xmx8g  org.apache.ctakes.spactes.pipeline.SpaCTeSBuilderRunner

echo "Running HeaderDetector for detecting Secions"
export HEADERDETECTOR=/ICTUSnet/HeaderDetector
python3 $HEADERDETECTOR/scripts/header_detector.py --set "$1" --data $TXT

export BRATMERGER=/ICTUSnet/BratMerger
python3 $BRATMERGER/scripts/merger.py --set "$1" --data $ANN_SECTION

