FROM centos:7

LABEL ca.easypath.vendor="EasyPath IT Solutions Inc." \
  ca.easypath.version="1.0.0"

ENV NGINX_VERSION 1.12.2-2.el7

RUN yum -y install epel-release && \
    yum -y install nginx-${NGINX_VERSION} telnet net-tools && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stdout /var/log/nginx/error.log && \
    touch /run/nginx.pid && chown root:nginx /run/nginx.pid && chmod 660 /run/nginx.pid && \
    rm /etc/nginx/nginx.conf.default && \
    mkdir -p /etc/nginx/stream.conf.d/

COPY --chown=root:nginx nginx.conf /etc/nginx/nginx.conf

# Need to fix permissions on config file after copying
RUN chmod 640 /etc/nginx/nginx.conf

STOPSIGNAL SIGTERM

EXPOSE 8080
EXPOSE 8443

USER nginx

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
