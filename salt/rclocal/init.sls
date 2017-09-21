/etc/rc.local:
 file.managed:
  - source: salt://rclocal/rc.local
  - template: jinja
  - mode: 755
  - user: root
  - group: root
