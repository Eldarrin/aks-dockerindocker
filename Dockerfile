FROM ubi8/ubi-minimal:8.6-751

RUN microdnf -y install docker-client && \
    microdnf clean all

WORKDIR /azp

COPY start.sh .

RUN chmod +x start.sh && \
    useradd agent && \
    chown -R agent:agent /azp && \
    chown -R agent:agent /home/agent

USER agent

CMD ["./start.sh"]