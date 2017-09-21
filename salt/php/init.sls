sury-php:
  pkgrepo.managed:
    - humanname: sury-php
    - name: deb https://packages.sury.org/php/ stretch main
    - file: /etc/apt/sources.list.d/sury-php.list
    - key_url: salt://php/sury.php.gpg

php71-fpm:
  pkg.installed:
    - name: php7.1-fpm
  service.running:
    - name: php7.1-fpm
    - enable: True
    - watch:
       - file: /etc/php/7.1/fpm/php-fpm.conf
       - file: /etc/php/7.1/fpm/php.ini
{% for pool, args in pillar['fpm_pools'].iteritems() %}
       - file: /etc/php/7.1/fpm/pool.d/{{ pool }}.conf
{% endfor %}
{% for website in pillar.nginx_confs %}
       - file: /etc/nginx/conf.d/{{ website }}.conf
{% endfor %}

/usr/local/bin/mod_files.sh:
 file.managed:
  - source: salt://php/mod_files.sh
  - mode: 755
  - user: root
  - group: root

/usr/local/bin/phpsessionsclean.sh:
 file.managed:
  - source: salt://php/phpsessionsclean.sh
  - template: jinja
  - mode: 755
  - user: root
  - group: root

{% for pool, args in pillar['fpm_pools'].iteritems() %}

/etc/php/7.1/fpm/pool.d/{{ pool }}.conf:
 file.managed:
  - source: salt://php/{{ pool }}.conf
  - template: jinja
  - context:
     poolname: {{ pool }}
     portnumber: {{ args.port }}
  - mode: 644
  - user: root
  - group: root

php-sessions-dir-{{ pool }}:
  cmd.run:
    - name: 'mod_files.sh {{ pillar.phpsessiondir }}/{{ pool }} 2 5 && chown -R www-data.www-data {{ pillar.phpsessiondir }}/{{ pool }}'
    - unless: 'test -d {{ pillar.phpsessiondir }}/{{ pool }}'
    - require:
      - file: /usr/local/bin/mod_files.sh
{% endfor %}


install-php-pkgs:
  pkg:
    - installed
    - names:
        - php7.1-common
        - php7.1-curl
        - php7.1-cli
        - php7.1-gd
        - php7.1-mysql
        - php7.1-intl
        - php7.1-sqlite3
        - php7.1-json
        - php7.1-mcrypt
        - php7.1-mbstring
        - php7.1-xml
        - php7.1-zip
        - php7.1-bz2
        - php7.1-bcmath

/etc/php/7.1/fpm/php-fpm.conf:
 file.managed:
  - source: salt://php/php-fpm.conf
  - mode: 644
  - user: root
  - group: root

/etc/php/7.1/fpm/php.ini:
 file.managed:
  - source: salt://php/php.ini
  - mode: 644
  - user: root
  - group: root

