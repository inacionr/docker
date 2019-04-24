FROM ubuntu:14.04

RUN apt-get update 
RUN apt-get install -y wget

RUN wget -c https://github.com/inacionr/docker/blob/master/ZendServer-CE.tar.gz?raw=true -O ZendServer-CE.tar.gz
RUN  tar -vzxf ZendServer-CE.tar.gz
RUN chmod +x ./ZendServer-5.1.0_Tarball_B7-php5.3.5-linux-glibc23-x86_64/install.sh


RUN ./ZendServer-5.1.0_Tarball_B7-php5.3.5-linux-glibc23-x86_64/install.sh -g
#RUN apt-get install apache2 -y
#RUN service apache2 start
RUN /usr/local/zend/bin/zendctl.sh restart
EXPOSE 10081

RUN ls 

CMD ["ping","localhost"]