FROM ubuntu:16.04
LABEL maintainer="Yogesh Kushwaha"

RUN apt-get update && apt-get install vim git -y

COPY odoo.conf /etc/odoo/odoo.cfg

RUN git clone https://github.com/kelseyhightower/helloworld.git /mnt/extra-addons/hellow-world1
RUN git clone https://github.com/kelseyhightower/helloworld.git /mnt/extra-addons/hellow-world2
RUN git clone https://github.com/kelseyhightower/helloworld.git /mnt/extra-addons/hellow-world3
RUN git clone https://github.com/kelseyhightower/helloworld.git /mnt/extra-addons/hellow-world4
#ENV addons_path=$(ls -d /mnt/extra-addons/* | paste -d, -s)
#RUN sed -i -e "s#__addons__path__#NEW_PATH#" /etc/odoo/odoo.cfg

COPY setup.sh /setup.sh
RUN ["chmod", "+x", "/setup.sh"]
RUN /bin/bash -c "/setup.sh"
