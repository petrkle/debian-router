icecast2:
  pkg:
    - installed
  service:
    - running
    - name: icecast2
    - enable: True

ezstream:
  pkg:
    - installed

/etc/default/icecast2:
 file.managed:
  - source: salt://icecast/icecast2
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: icecast2

/usr/local/bin/next-song.sh:
 file.managed:
  - source: salt://icecast/next-song.sh
  - template: jinja
  - mode: 755
  - user: root
  - group: root

/etc/icecast2/icecast.xml:
 file.managed:
  - source: salt://icecast/icecast.xml
  - template: jinja
  - mode: 644
  - user: root
  - group: root

/etc/icecast2/ezstream.xml:
 file.managed:
  - source: salt://icecast/ezstream.xml
  - template: jinja
  - mode: 644
  - user: root
  - group: root

/etc/init.d/ezstream:
 file.managed:
  - source: salt://icecast/ezstream
  - mode: 755
  - user: root
  - group: root
  - template: jinja
  - watch_in:
      - service: ezstream

ezstreaminitscript:
 cmd.run:
  - name: 'update-rc.d ezstream defaults && /etc/init.d/ezstream start'
  - cwd: /etc/init.d
  - runas: root
  - unless: 'service ezstream'
 service.running:
  - name: ezstream
  - enable: True
