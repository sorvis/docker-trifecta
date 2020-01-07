FROM java:8
MAINTAINER Jan Schulte <jan@janschulte.com>

ENV TRIFECTA_VERSION=0.21.3 TRIFECTA_URL=https://github.com/ldaniels528/trifecta/releases/download

RUN useradd -r -m trifecta

USER trifecta

WORKDIR /home/trifecta

RUN wget -O trifecta_ui-$TRIFECTA_VERSION.zip https://github.com/ldaniels528/trifecta/releases/download/v0.22.0rc8-0.10.1.0/trifecta-ui-0.22.0rc8b-0.10.1.0.zip  && \
	unzip trifecta_ui-$TRIFECTA_VERSION.zip  && \
	rm trifecta_ui-$TRIFECTA_VERSION.zip && \
	ln -s trifecta-ui-0.22.0rc8b-0.10.1.0 trifecta_ui && \
	mkdir /home/trifecta/.trifecta

COPY entrypoint.sh /home/trifecta/
COPY config.properties /home/trifecta/.trifecta/

VOLUME /home/trifecta/conf
EXPOSE 9000

ENTRYPOINT ["/home/trifecta/entrypoint.sh", "/home/trifecta/.trifecta/config.properties"]