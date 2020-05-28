FROM jenkins/jenkins:lts

USER root

RUN apt-get update -qq && apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -

RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"

RUN apt-get update && apt-get install docker-ce docker-ce-cli containerd.io -y

RUN usermod -aG docker jenkins

RUN systemctl enable docker


#RUN systemctl start docker

#USER root

#RUN sudo /etc/init.d/dbus start

#RUN apt-get install systemd && sudo /etc/init.d/dbus start && systemctl start docker

