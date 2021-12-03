FROM voidlinux/voidlinux AS base
RUN xbps-install -Syu && \
    xbps-install -Sy ansible python3

FROM base 
ARG user=kg
ARG group=kg

RUN groupadd ${group} && useradd -m  -g ${group} ${user}
WORKDIR ansible
COPY . .
CMD ["ansible-playbook", "local.yml"]
