FROM adoptopenjdk/openjdk8-openj9
LABEL maintainer="Chrisopal"

ENV RELEASE 2019-02-18_0433
ENV VERSION 19.0.0.2-cl190220190218-0300

RUN apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && curl https://public.dhe.ibm.com/ibmdl/export/pub/software/openliberty/runtime/nightly/${RELEASE}/openliberty-all-${VERSION}.zip -L -o openliberty.zip \
    && unzip openliberty.zip -d /opt \
    && rm openliberty.zip

ENV INSTALL_DIR /opt/wlp/
ENV CONFIG_DIR /opt/wlp/usr/servers/defaultServer/
ENV DEPLOYMENT_DIR /opt/wlp/usr/servers/defaultServer/dropins/

COPY server.xml ${CONFIG_DIR}configDropins/defaults/

EXPOSE 9080 9443

CMD ["/opt/wlp/bin/server", "run", "defaultServer"]