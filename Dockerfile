FROM linuxserver/wireguard
# Requests before IP Rotation
ENV MAX=3
# Just some environment variables that are suggested for linuxserver/wireguard
ENV PUID=1000
ENV PGID=1000
ENV TZ=Europe/Berlin
# Install mitmproxy
RUN apt-get update && apt-get install -y mitmproxy
COPY wireguard-rotator.py /wireguard-rotator.py
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/bin/bash","-c","/usr/local/bin/entrypoint.sh"]