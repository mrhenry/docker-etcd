FROM ubuntu

RUN apt-get update -y \
 && apt-get install -y curl \
 && curl -L  https://github.com/coreos/etcd/releases/download/v2.3.1/etcd-v2.3.1-linux-amd64.tar.gz -o etcd-v2.3.1-linux-amd64.tar.gz \
 && tar xzvf etcd-v2.3.1-linux-amd64.tar.gz \
 && cp etcd-v2.3.1-linux-amd64/etc* /bin/ \
 && rm -rf etcd-v2.3.1-linux-amd64.tar.gz etcd-v2.3.1-linux-amd64

EXPOSE 2379/tcp
EXPOSE 4001/tcp
EXPOSE 2380/tcp

ADD ./run-etcd /bin/run-etcd
CMD ["/bin/run-etcd"]
