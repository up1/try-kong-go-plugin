FROM ubuntu:xenial

ENV KONG_VERSION kong-2.0.0preview1
	
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates curl perl unzip \
    && rm -rf /var/lib/apt/lists/* \
    && curl -fsSLo kong.deb https://bintray.com/kong/kong-preview/download_file?file_path=kong-2.0.0preview1.xenial.amd64.deb \
    && apt-get purge -y --auto-remove ca-certificates curl \
	&& dpkg -i kong.deb \
	&& rm -rf kong.deb

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 8000 8443 8001 8444

STOPSIGNAL SIGQUIT

CMD ["kong", "docker-start"]