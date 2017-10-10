FROM tagip/alpine-elixir:1.5

RUN apk --update --no-cache add docker openrc git

ENTRYPOINT rc-service docker restart && bash
