FROM ubuntu:16.04

# get the latest fixes
RUN apt-get update && apt-get upgrade -y

# install LibreOffice run-time dependencies
# install apt-transport-https in order to set up repo for Poco
# install adduser, findutils and cpio that we need later
RUN apt-get -y install libreoffice-base-core fontconfig libcups2 libcairo2 libcap2-bin gnupg net-tools apt-transport-https locales-all wget libxinerama1 libgl1-mesa-glx libfontconfig1 libfreetype6 libxrender1 libxcb-shm0 libxcb-render0 adduser cpio findutils && \
    adduser --quiet --system --group --home /opt/lool lool && \

# set up 3rd party repo of Poco, dependency of loolwsd
    echo "deb https://collaboraoffice.com/repos/Poco/ /" >> /etc/apt/sources.list.d/poco.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0C54D189F4BA284D && \
    apt-get update -y && \
    apt-get -y install libpoco*48 libpoco-dev
RUN wget http://se.archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    dpkg -i libpng12-0_1.2.54-1ubuntu1_amd64.deb && \
    echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections && \
    apt-get install ttf-mscorefonts-installer -y
COPY --chown=lool:lool /rootfs /

# set up LibreOffice Online (normally done by postinstall script of package)
RUN setcap cap_fowner,cap_mknod,cap_sys_chroot=ep /usr/bin/loolforkit && \
    mkdir -p /var/cache/loolwsd && chown lool: /var/cache/loolwsd && \
    rm -rf /var/cache/loolwsd/* && \
    mkdir -p /opt/lool/child-roots && \
    chown lool: /opt/lool && \
    chown lool: /opt/lool/child-roots && \
    touch /var/log/loolwsd.log && \
    ln -s /usr/share/fonts/office /opt/lool/systemplate/usr/share/fonts/office && \
    fc-cache -fv && \
    chown lool /var/log/loolwsd.log
    
EXPOSE 9980    
CMD bash /run-lool.sh