FROM centos:7

ENV APP_ROOT=${APP_ROOT:-/usr/local}
ENV SOFTETHER_VPN_DL=https://github.com/SoftEtherVPN/SoftEtherVPN_Stable/releases/download/v4.34-9745-beta/softether-vpnserver-v4.34-9745-beta-2020.04.05-linux-x64-64bit.tar.gz

WORKDIR $APP_ROOT

RUN yum -y install gcc make which net-tools

RUN curl -L ${SOFTETHER_VPN_DL} > softether-vpnserver.tar.gz

RUN tar -xvf softether-vpnserver.tar.gz

RUN cd vpnserver && make i_read_and_agree_the_license_agreement

RUN cd vpnserver && chmod 600 * && chmod 700 vpncmd && chmod 700 vpnserver

CMD ["/usr/local/vpnserver/vpnserver", "execsvc"]
