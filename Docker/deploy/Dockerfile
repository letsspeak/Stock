FROM letsspeak/stock-ci:latest

LABEL maintainer="letsspeak"

COPY stock /var/stock
EXPOSE 8080

ENTRYPOINT PORT=8080 /var/stock/.build/release/stock serve --env=production
