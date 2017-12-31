FROM letsspeak/stock-ci:latest

LABEL maintainer="letsspeak"

COPY stock /var/stock
WORKDIR /var/stock

ENTRYPOINT ./.build/release/stock serve
