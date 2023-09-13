FROM alpine:3.18.3

COPY ./docker-entrypoint.sh /

RUN awk 'NR==2' /etc/apk/repositories | sed 's/main/community/' | tee -a /etc/apk/repositories

RUN apk update

RUN apk add curl unzip ncurses postgresql-client file-dev

# + extra optional packages
RUN apk add imagemagick ffmpeg exiftool

RUN apk add openssl1.1-compat

RUN adduser --system --shell  /bin/false --home /opt/pleroma pleroma

ENV FLAVOUR="amd64-musl"

## Install Pleroma OTP
RUN curl "https://git.pleroma.social/api/v4/projects/2/jobs/artifacts/stable/download?job=$FLAVOUR" -o /tmp/pleroma.zip
RUN unzip /tmp/pleroma.zip -d /tmp/

RUN mv /tmp/release/* /opt/pleroma
RUN rmdir /tmp/release
RUN rm /tmp/pleroma.zip

RUN chown -R pleroma /opt/pleroma

# Public directory
RUN mkdir -p /var/lib/pleroma/uploads
RUN chown -R pleroma /var/lib/pleroma
# Config directory
RUN mkdir -p /var/lib/pleroma/static
RUN chown -R pleroma /var/lib/pleroma

WORKDIR /opt/pleroma

COPY ./config.exs /etc/pleroma/
RUN chmod o= /etc/pleroma/config.exs
RUN chown pleroma /etc/pleroma/config.exs

USER pleroma

EXPOSE 4000

ENTRYPOINT /docker-entrypoint.sh
