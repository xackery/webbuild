FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
    && apt-get -y install --no-install-recommends locales apt-utils dialog 2>&1 \
    && apt-get -y install --no-install-recommends build-essential git less wget curl npm gnupg \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get -y update \
    && apt-get -y install --no-install-recommends yarn \
    #clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

RUN npm install -g sass
# fix locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen \
    && dpkg-reconfigure --frontend=noninteractive locales \
    && update-locale LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=dialog
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /src
WORKDIR /src
RUN npm version | grep npm
RUN node --version
CMD ["make"]