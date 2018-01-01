FROM letsspeak/stock-ci:latest

LABEL maintainer="letsspeak"

COPY stock /var/stock
EXPOSE 8080

ENTRYPOINT /var/stock/.build/release/stock serve
