FROM ubuntu:16.04

MAINTAINER kinglf

RUN apt-get update -qqy \
  && apt-get -qqy install libnss3 libnss3-tools libfontconfig1 wget ca-certificates apt-transport-https inotify-tools \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

# Find the latest unstable version here: https://www.ubuntuupdates.org/google-chrome-unstable.
ENV CHROME_VERSION=67.0.3386.1-1
ENV LANG=C.UTF-8
RUN wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add - 
RUN echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update -qqy
RUN apt-get -qqy install google-chrome-unstable=${CHROME_VERSION}
RUN rm /etc/apt/sources.list.d/google-chrome.list
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

EXPOSE 9222

ADD start.sh import_cert.sh /usr/bin/

RUN mkdir /data
VOLUME /data
ENV HOME=/data DEBUG_ADDRESS=0.0.0.0 DEBUG_PORT=9222

CMD ["/usr/bin/start.sh"]

