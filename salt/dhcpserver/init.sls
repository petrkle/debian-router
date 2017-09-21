isc-dhcp-server:
  pkg:
    - installed
  service:
    - running
    - name: isc-dhcp-server
    - enable: True

/etc/dhcp/dhcpd.conf:
 file.managed:
  - source: salt://dhcpserver/dhcpd.conf
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: isc-dhcp-server

/etc/default/isc-dhcp-server:
 file.managed:
  - source: salt://dhcpserver/isc-dhcp-server
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: isc-dhcp-server
