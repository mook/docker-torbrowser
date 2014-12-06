# vim: set et ts=4 :

FROM debian:jessie

ENV TOR_VERSION 4.0.2
ENV TOR_LANGUAGE en-US

RUN export DEBIAN_FRONTEND=noninteractive \
    && TOR_URL=https://dist.torproject.org/torbrowser/${TOR_VERSION}/tor-browser-linux64-${TOR_VERSION}_${TOR_LANGUAGE}.tar.xz \
    && apt-get update -q \
    && apt-get install -qy iceweasel curl xauth xz-utils \
    && mkdir /tor-browser \
    && curl "${TOR_URL}" | tar --extract --directory=/tor-browser --xz --strip-components=1 \
    && apt-get remove -qy --auto-remove curl xz-utils \
    && apt-get remove -qy iceweasel \
    && apt-get clean \
    && rm -fr /var/lib/apt/lists/

RUN useradd --uid 1000 --create-home docker-user \
    && true

CMD touch ${HOME}/.Xauthority ; echo "${XAUTHDATA}" | /usr/bin/xauth nmerge - && /tor-browser/start-tor-browser
