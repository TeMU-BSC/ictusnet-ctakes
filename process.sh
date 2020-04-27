#!/bin/bash

export CTAKES_HOME=/ICTUSnet/ctakes-SpaCTeS

export TXT=/ICTUSnet/data/TXT
export ANN_VARIABLE=/ICTUSnet/data/ANN_VARIABLE
export ANN_SECTION=/ICTUSnet/data/ANN_SECTION
export ANN_FINAL=/ICTUSnet/data/ANN_FINAL

echo "Detecting Variables ..."
java -Djava.library.path=/usr/local/share/freeling/APIs/java -cp $CTAKES_HOME/lib/*:$CTAKES_HOME/ctakes-SpaCTeS-4.0.1-SNAPSHOT.jar -Dlog4j.configuration=file:$CTAKES_HOME/config/log4j.xml -Xmx8g  org.apache.ctakes.spactes.pipeline.SpaCTeSBuilderRunner

echo "Detecting Sections ..."
export HEADERDETECTOR=/ICTUSnet/HeaderDetector
python3 $HEADERDETECTOR/scripts/header_detector.py --data $TXT

echo "MErging Variables and Sections ..."
export BRATMERGER=/ICTUSnet/BratMerger
python3 $BRATMERGER/scripts/merger.py --data $ANN_SECTION

