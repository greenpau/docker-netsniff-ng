FROM centos:latest

MAINTAINER Paul Greenberg @greenpau

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

RUN rpm -ivh http://mirror.symnds.com/distributions/gf/el/7/gf/x86_64/gf-release-7-8.gf.el7.noarch.rpm

RUN yum -y update

RUN yum -y install git gcc vim make man flex bison libnl libnl-devel \
 libnet libnet-devel libnetfilter_conntrack libnetfilter_conntrack-devel \
 libpcap libpcap-devel zlib zlib-devel libssl ncurses ncurses-devel \
 ccache userspace-rcu userspace-rcu-devel libnl3 \
 libnl3-devel libnl3-cli libcli nacl nacl-devel

RUN cd /tmp && rm -rf netsniff-ng && \
 git clone https://github.com/netsniff-ng/netsniff-ng.git && \
 cd netsniff-ng/ && ./configure && make && make install
