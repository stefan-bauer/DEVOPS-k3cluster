FROM  mcr.microsoft.com/devcontainers/base:noble

RUN apt-get update && apt-get install -y \
    curl \
    vim  \
    ssh-client \
    wireguard \
    iputils-ping \
    dnsutils \
    netcat-openbsd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./ssh/id_rsa_mcair_k3cluster /home/vscode/.ssh/id_rsa_mcair_k3cluster
COPY ./ssh/id_rsa_mcair_k3cluster.pub /home/vscode/.ssh/id_rsa_mcair_k3cluster.pub
COPY ./ssh/config /home/vscode/.ssh/config
# COPY ./wireguard/wg0.conf /etc/wireguard/wg0.conf
# COPY ./ssh/known_hosts /home/vscode/.ssh/known_hosts


RUN chmod 644 /home/vscode/.ssh/id_rsa_mcair_k3cluster
RUN chmod 644 /home/vscode/.ssh/id_rsa_mcair_k3cluster.pub
RUN chmod 644 /home/vscode/.ssh/config

# 

