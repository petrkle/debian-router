letsencrypt-www-dir-create:
  file.directory:
    - name: /home/www/letsencrypt/www
    - user: petr
    - group: www-data
    - mode: 0775
    - makedirs: True

/home/www/letsencrypt/domains.txt:
 file.managed:
  - source: salt://letsencrypt/domains.txt
  - mode: 644
  - user: petr
  - group: www-data

/home/www/letsencrypt/config.sh:
 file.managed:
  - source: salt://letsencrypt/config.sh
  - mode: 644
  - user: petr
  - template: jinja
  - group: www-data

https://github.com/lukas2511/dehydrated.git:
  git.latest:
    - target: /home/www/letsencrypt/bin
    - rev: v0.4.0
    - force_reset: True

/usr/local/bin/le-cron.sh:
 file.managed:
  - source: salt://letsencrypt/le-cron.sh
  - template: jinja
  - mode: 755
  - user: root
  - group: root
