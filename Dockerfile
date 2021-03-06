FROM fluent/fluentd:v1.11-1

# Use root account to use apk
USER root

RUN apk add --no-cache --update --virtual .build-deps \
  sudo build-base ruby-dev \
  && sudo gem install fluent-plugin-s3 \
  && sudo gem sources --clear-all \
  && apk del .build-deps \
  && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent
