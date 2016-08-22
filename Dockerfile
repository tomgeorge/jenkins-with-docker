FROM jenkins
USER root
RUN apt-get update && \
apt-get install -y \
	apt-transport-https \
	ca-certificates \
	apt-utils && \
	apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D && \
	echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list && \
	apt-get update && \
	apt-get install -y docker-engine
RUN usermod -g $(cat /etc/group | grep staff | cut -d: -f3) jenkins
VOLUME /var/run/docker.sock
USER jenkins
