FROM taln/freeling:latest

LABEL maintainer="siamak.barzegar@bsc.es"

ENV HOME_ICTUS ""

RUN mkdir -p $HOME_ICTUS/ICTUSnet/ctakes-SpaCTeS

COPY spactes-resources-bin/ $HOME_ICTUS/ICTUSnet/ctakes-SpaCTeS/ 

RUN apt-get -qq update && \
    apt-get install -y python3-dev python3-pip python3-tk python3-lxml python3-six

RUN pip3 install unidecode

WORKDIR $HOME_ICTUS/ICTUSnet

RUN git clone https://github.com/TeMU-BSC/EHR-HeaderDetector-AnnotationAnalyser HeaderDetector
RUN git clone https://github.com/TeMU-BSC/BratMerger

COPY process.sh $HOME_ICTUS/ICTUSnet/
RUN chmod a+x $HOME_ICTUS/ICTUSnet/process.sh && cp $HOME_ICTUS/ICTUSnet/process.sh /bin/process.sh
