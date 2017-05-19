FROM nextjournal/docker-erlang:19.2.1-test-server
MAINTAINER Holger Amann <holger@nextjournal.com>

ARG ELIXIR_VERSION=1.4.2

LABEL name="elixir" version=$ELIXIR_VERSION

RUN set -xe \
    && apk --update add --virtual build-dependencies wget ncurses-libs ca-certificates \
    && wget --no-check-certificate https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip \
    && mkdir -p /opt/elixir-${ELIXIR_VERSION}/ \
    && unzip Precompiled.zip -d /opt/elixir-${ELIXIR_VERSION}/ \
    && rm Precompiled.zip \
    && apk del build-dependencies \
    && rm -rf /etc/ssl \
    && rm -rf \
      /var/cache/apk/* \
      /tmp/*


ENV PATH $PATH:/opt/elixir-${ELIXIR_VERSION}/bin

CMD ["/bin/sh"]
