FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
    && apt-get -y install --no-install-recommends locales apt-utils dialog 2>&1 \
    && apt-get -y install git npm less wget \
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

CMD ["make"]