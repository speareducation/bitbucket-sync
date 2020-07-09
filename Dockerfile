FROM alpine/git
COPY entrypoint.sh /entrypoint.sh
RUN apk add curl jq
ENTRYPOINT ["/entrypoint.sh"]
