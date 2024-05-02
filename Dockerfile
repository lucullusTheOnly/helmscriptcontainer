FROM redhat/ubi8:8.6

COPY files/kubernetes.repo /etc/yum.repos.d/
COPY files/helm /usr/local/bin/
COPY files/start_deployment.sh /usr/local/bin/
COPY files/urlencode.py /usr/local/bin

RUN dnf install -y kubectl git && \
    useradd --uid 1000 --gid 0 --home-dir /home/deployment deployment && \
    chmod -R 770 /home/deployment && chown -R 1000:0 /home/deployment && \
    chmod +x /usr/local/bin/start_deployment.sh && \
    chmod +x /usr/local/bin/urlencode.py

USER 1000:0

ENTRYPOINT start_deployment.sh
