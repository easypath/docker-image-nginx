NGINX
=====
Runs NGINX 1.12.2 from the [EPEL repo](https://fedoraproject.org/wiki/EPEL) on CentOS 7. Configured to run as non-root. Dockerfile based on the offical Docker NGINX image ([mainline stretch](https://github.com/nginxinc/docker-nginx/tree/master/mainline/stretch)).

Available on Docker Hub: [easypath/nginx](https://hub.docker.com/r/easypath/nginx/)


Building
--------
Push to Docker Hub using Ansible:
```
ansible-playbook build.yaml -i localhost,
```

Running container:
```
docker run -d -p 80:8080 easypath/nginx:1.0
```

Access console:
```
docker run -it easypath/nginx:1.0 bash
```
