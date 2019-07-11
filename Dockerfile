FROM alpine:3.8

RUN \
	apk add --no-cache bash nginx-mod-http-lua vim \
	&& apk add --no-cache --virtual build-dependencies make gcc libc-dev git \
	&& rm -rf /etc/nginx/conf.d \
	&& mkdir -p /run/nginx /usr/share/lua/common \
	&& git clone https://github.com/juce/sockproc.git \
	&& make -C sockproc \
	&& cp -a  sockproc/sockproc /usr/sbin/sockproc \
	&& rm -rf sockproc \
	&& git clone https://github.com/juce/lua-resty-shell.git \
	&& cp -a lua-resty-shell/lib/resty /usr/share/lua/common/resty \
	&& rm -rf lua-resty-shell \
	&& chown nginx /var/lib/nginx/logs /run/nginx \
	&& chmod 4755 /bin/ping \
	&& apk del build-dependencies

COPY --chown=nginx:nginx ./rtt /usr/bin/rtt
COPY --chown=nginx:nginx ./nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx ./init /init

USER nginx
ENTRYPOINT /init

