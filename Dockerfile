FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y curl vim python3 python3-pip git libffi-dev libssl-dev openssh-server

RUN python3 -m pip install --upgrade pip cffi && \
    pip3 install ansible-core && \
    pip3 install ansible && \
    pip3 install requests && \
    pip install --upgrade pywinrm && \
    ansible-galaxy collection install azure.azcollection && \
    pip3 install -r ~/.ansible/collections/ansible_collections/azure/azcollection/requirements-azure.txt && \
    rm -rf /root/.cache/pip

COPY id_rsa.pub /root/.ssh/id_rsa.pub
COPY id_rsa /root/.ssh/id_rsa
RUN cat /root/.ssh/id_rsa.pub > /root/.ssh/authorized_keys
RUN chmod 600 -R /root/.ssh/

EXPOSE 22
