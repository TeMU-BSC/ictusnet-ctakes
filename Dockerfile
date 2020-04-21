FROM taln/freeling:latest
# FROM python:3

MAINTAINER Siamak Barzegar <siamak.barzegar@bsc.es>

RUN 	wget http://temu.bsc.es/spactes-resources-bin.tar.gz && \
	tar -xzvf spactes-resources-bin.tar.gz && \
	mkdir -p /ICTUSnet/ctakes-SpaCTeS/ && \
	mv spactes-resources-bin/* /ICTUSnet/ctakes-SpaCTeS/

RUN     apt-get -qq update && \
        apt-get install -y python3-dev python3-pip python3-tk python3-lxml python3-six

#	rm -rf /spactes-resources-bin && \
#	rm -rf /spactes-resources-bin.tar.gz &&\
RUN	pip3 install unidecode

WORKDIR /ICTUSnet

RUN git clone https://github.com/TeMU-BSC/EHR-HeaderDetector-AnnotationAnalyser HeaderDetector

RUN git clone https://github.com/TeMU-BSC/BratMerger

COPY process.sh /ICTUSnet/
RUN chmod a+x /ICTUSnet/process.sh && cp /ICTUSnet/process.sh /bin/process.sh
