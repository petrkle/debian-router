minidlna:
  pkg:
    - installed
  service:
    - running
    - name: minidlna
    - enable: True

/etc/default/minidlna:
 file.managed:
  - source: salt://minidlna/minidlna
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: minidlna

/etc/minidlna.conf:
 file.managed:
  - source: salt://minidlna/minidlna.conf
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: minidlna
