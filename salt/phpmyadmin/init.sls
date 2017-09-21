phpmyadmin-dir-create:
  file.directory:
    - name: /home/www/phpmyadmin
    - user: www-data
    - group: www-data
    - mode: 0755

phpmyadmin:
  archive.extracted:
    - name: /home/www/phpmyadmin
    - source: https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_{{ pillar.phpmyadmin.version }}.tar.gz
    - source_hash: md5={{ pillar.phpmyadmin.md5 }}
    - order: 1
    - require:
      - file: /home/www/phpmyadmin

/home/www/phpmyadmin/phpmyadmin-RELEASE_{{ pillar.phpmyadmin.version }}/config.inc.php:
 file.managed:
  - source: salt://phpmyadmin/config.inc.php
  - mode: 644
  - user: www-data
  - group: www-data
  - template: jinja
  - require:
     - file: /home/www/phpmyadmin

chown-phpmyadmin-recursive:
  cmd.run:
    - name: chown -R www-data.www-data /home/www/phpmyadmin/phpmyadmin-RELEASE_{{ pillar.phpmyadmin.version }}
    - unless: test `stat -c '%U' /home/www/phpmyadmin/phpmyadmin-RELEASE_{{ pillar.phpmyadmin.version }}` = www-data
    - order: 2

install-phpmyadmin-libs:
  cmd.run:
    - cwd: /home/www/phpmyadmin/phpmyadmin-RELEASE_{{ pillar.phpmyadmin.version }}
    - name: yes | sudo -u www-data -H /usr/local/bin/composer update --no-dev
    - unless: test -d /home/www/phpmyadmin/phpmyadmin-RELEASE_{{ pillar.phpmyadmin.version }}/vendor
    - order: 2
    - watch_in:
      - service: nginx
