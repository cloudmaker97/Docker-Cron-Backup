FROM alpine
RUN \
	apk add --no-cache tzdata
ENV TZ=Europe/Berlin
RUN \
	mkdir -p /aws && \
	apk -Uuv add groff less python3 py3-pip curl && \
	pip3 install --no-cache-dir awscli && \
	apk --purge -v del py-pip && \
	rm /var/cache/apk/*
WORKDIR /app
COPY entrypoint.sh /app
RUN mkdir -p /app/scripts
COPY ./scripts/* /app/scripts
RUN chmod -R +x /app
ENTRYPOINT /app/entrypoint.sh