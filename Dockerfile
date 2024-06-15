FROM ubuntu:24.04
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y openjdk-21-jdk
RUN apt-get install -y git
RUN git clone https://github.com/r-eifler/enhsp-xaip.git
WORKDIR "enhsp-xaip"
RUN ./compile
RUN ./install
COPY "en.sh" "/enhsp-xaip"
RUN chmod +x "/enhsp-xaip/en.sh"
ENTRYPOINT ["/enhsp-xaip/en.sh"]