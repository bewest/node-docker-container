
# DOCKER-VERSION 0.6.1

FROM ubuntu
MAINTAINER Ben West "bewest@gmail.com"

RUN apt-get update
RUN apt-get install -y build-essential software-properties-common python-software-properties python g++ make
RUN apt-get update
ADD http://nodejs.org/dist/v0.10.17/node-v0.10.17.tar.gz nodesrc/
RUN (cd nodesrc ; tar -zxvf node-v0.10.17.tar.gz ; cd node-v0.10.17/ ; ./configure; make ; make install)

CMD [ "/usr/bin/node", "-v" ]

EXPOSE 80

#####
# EOF
