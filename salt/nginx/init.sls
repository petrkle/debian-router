nginxrepo:
  pkgrepo.managed:
    - humanname: nginx
    - name: deb http://nginx.org/packages/mainline/debian/ stretch nginx
    - file: /etc/apt/sources.list.d/nginx.list
    - key_url: salt://nginx/nginx.gpg

nginx:
  pkg.installed:
    - name: nginx
  service.running:
    - name: nginx
    - enable: True
    - reload: True
    - watch:
{% for website in pillar.nginx_confs %}
       - file: /etc/nginx/conf.d/{{ website }}.conf
{% endfor %}

/usr/share/nginx/html/index.html:
 file.managed:
  - source: salt://nginx/index.html
  - mode: 644
  - user: root
  - group: root

/home/www/{{ pillar.hostname }}.example.cz/index.html:
 file.managed:
  - source: salt://nginx/index.html
  - mode: 644
  - user: root
  - group: root
  - makedirs: True

/usr/share/nginx/html/50x.html:
 file.managed:
  - source: salt://nginx/50x.html
  - mode: 644
  - user: root
  - group: root

/etc/nginx/nginx.conf:
 file.managed:
  - source: salt://nginx/nginx.conf
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: nginx

/etc/nginx/mime.types:
 file.managed:
  - source: salt://nginx/mime.types
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: nginx

/etc/nginx/fastcgi_params:
 file.managed:
  - source: salt://nginx/fastcgi_params
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: nginx

/etc/nginx/conf.d/default.conf:
 file.absent

/etc/nginx/conf.d/example_ssl.conf:
 file.absent

/etc/cert/dhparams.pem:
 file.managed:
  - source: salt://cert/dhparams.pem
  - mode: 644
  - user: root
  - group: root
  - makedirs: True
  - watch_in:
      - service: nginx

{% for website in pillar.nginx_confs %}

/etc/nginx/conf.d/{{ website }}.conf:
 file.managed:
  - source: salt://nginx/conf/{{ website }}.conf
  - mode: 644
  - user: root
  - group: root
  - template: jinja
  - makedirs: True

{% endfor %}
