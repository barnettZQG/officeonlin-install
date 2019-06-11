FROM barnett/collabora:190611-image-r1

RUN apt-get install -y language-pack-zh-hans tzdata &&  \
     localedef -c -i zh_CN -f UTF-8 zh_CN.UTF-8 && rm /etc/localtime && \
     ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
     mkdir /usr/share/fonts/custom
ADD fonts/  /usr/share/fonts/custom
RUN fc-cache -fv && \
    rm -rf /opt/lool/systemplate/var/cache/fontconfig/* && \
    cp /var/cache/fontconfig/* /opt/lool/systemplate/var/cache/fontconfig && \
    ln -s /usr/share/fonts/* /opt/lool/systemplate/usr/share/fonts && \
    rm -rf /opt/lool/systemplate/etc/fonts && \
    cp -R /etc/fonts/ /opt/lool/systemplate/etc/fonts 
EXPOSE 9980
ADD start.sh /opt/start.sh
ADD loleaflet.html /usr/share/loolwsd/loleaflet/dist/loleaflet.html
ADD loolwsd.xml /etc/loolwsd/loolwsd.xml
RUN chmod +x /opt/start.sh
ENV username=admin
ENV password=admin
ENV ENABLE_SSL=false
ENV LC_ALL=zh_CN.UTF-8
ENV LC_CTYPE=zh_CN.UTF-8
ENV LC_ALL=zh_CN.UTF-8
ENV LANG=zh_CN.UTF-8
CMD ["bash", "-c", "/opt/start.sh" ]