#!/bin/bash
PATH=`pwd`
/usr/bin/docker run --privileged --name app -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /var/www/html:$PATHvolumes/var/www/html -p 8022:22 -p 8080:80 -p 8443:443 -dt app-centos
#docker kill app-centos && docker rm app-centos && docker run --privileged --name app -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 -p 8443:443 -dt app-centos
