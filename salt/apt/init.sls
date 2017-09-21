/etc/apt/sources.list:
 file.managed:
  - source: salt://apt/sources.list
  - mode: 644
  - user: root
  - group: root

/usr/local/bin/akt.sh:
 file.managed:
  - source: salt://apt/akt.sh
  - mode: 700
  - user: root
  - group: root
