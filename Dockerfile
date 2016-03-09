FROM busybox:glibc
MAINTAINER it-operations@boerse-go.de
ENV TOOL=vault \
    VERSION=0.5.1 \
    SHA256=7319b6514cb5ca735d9886d7b7e1ed8730ee38b238bb1626564436b824206d12

ADD https://releases.hashicorp.com/${TOOL}/${VERSION}/${TOOL}_${VERSION}_linux_amd64.zip ${TOOL}_${VERSION}_linux_amd64.zip
RUN echo "${SHA256}  ${TOOL}_${VERSION}_linux_amd64.zip" | sha256sum -cw &&\
    unzip ${TOOL}_${VERSION}_linux_amd64.zip &&\
    rm -r ${TOOL}_${VERSION}_linux_amd64.zip

ENTRYPOINT ["/vault"]
CMD ["--help"]
