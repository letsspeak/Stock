FROM letsspeak/stock-ci:latest

LABEL maintainer="letsspeak"

COPY stock /var/stock
EXPOSE 80

ENTRYPOINT PORT=80 /var/stock/.build/release/stock serve
