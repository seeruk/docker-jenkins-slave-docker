FROM seeruk/docker-jenkins-slave:latest
MAINTAINER Elliot Wright <elliot@elliotwright.co>

RUN \
    for key in \
        58118E89F3A912897C070ADBF76221572C52609D \
    ; do \
        apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys "$key"; \
    done && \
    for repo in \
        "deb http://apt.dockerproject.org/repo ubuntu-trusty main" \
    ; do \
        echo "$repo" > /etc/apt/sources.list.d/docker.list; \
    done && \
    apt-get update && \
    apt-get install -y docker-engine && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    usermod -aG docker jenkins

WORKDIR /opt/jenkins-slave-setup

CMD /opt/jenkins-slave-setup/start-slave.sh
