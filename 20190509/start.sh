#!/bin/bash
export LC_CTYPE=zh_CN.UTF-8

cp /etc/resolv.conf /etc/hosts /opt/lool/systemplate/etc/
perl -pi -e "s/localhost<\/host>/${domain}<\/host>/g" /etc/loolwsd/loolwsd.xml
perl -pi -e "s/ENABLE_SSL/${ENABLE_SSL}/g" /etc/loolwsd/loolwsd.xml
extra_params="--o:admin_console.username=${username} --o:admin_console.password=${password}"
su -c "/usr/bin/loolwsd --version --o:sys_template_path=/opt/lool/systemplate --o:lo_template_path=/opt/libreoffice --o:child_root_path=/opt/lool/child-roots --o:file_server_root_path=/usr/share/loolwsd ${extra_params}" -s /bin/bash lool
