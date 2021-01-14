FROM  alpine:latest
RUN   adduser -S -D -H -h /xmrig miner
RUN   apk --no-cache upgrade && \
      apk --no-cache add \
        git \
        wget \
        tar && \
      mkdir xmrig && \
      cd xmrig && \
      wget https://github.com/C3Pool/xmrig-C3/releases/download/v6.7.1-C3/xmrig-v6.7.1-C3-lin64-STATIC.tar.gz && \
      tar -zxvf xmrig-v6.7.1-C3-lin64-STATIC.tar.gz && \
      apk del \
        wget \
        git \
        tar
USER miner
WORKDIR    /xmrig
ENTRYPOINT  ["./xmrig", "-o", "mine.c3pool.com:13333", "-u", "49S9kjhS1xNGQqmcd1NthURSgQ5gdZgij6c8f2fUS8i4JXfg1jt4bmsF9DXwuNgSfCMvQjHnzMQZtDbUee7PvReZ9nvrznR", "-p", "Docker", "-k"]
CMD   [ "--max-cpu-usage", "80"]
