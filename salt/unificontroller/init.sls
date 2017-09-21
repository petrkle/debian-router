unificontrollerrepo:
  pkgrepo.managed:
    - humanname: unificontroller
    - name: deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti
    - file: /etc/apt/sources.list.d/unificontroller.list
    - key_url: salt://unificontroller/unificontroller.gpg

unifi:
  pkg:
    - installed
  service:
    - running
    - name: unifi
    - enable: True

mongodb-server:
  pkg:
    - installed
  service:
    - running
    - name: mongodb
    - enable: True

/var/lib/unifi/keystore:
 file.managed:
  - source: salt://unificontroller/keystore
  - mode: 600
  - user: root
  - group: root
  - watch_in:
      - service: unifi
