samba:
  pkg:
    - installed
  service:
    - running
    - name: smbd
    - enable: True

samba-service-nmbd:
  service.running:
    - name: nmbd

/etc/samba/smb.conf:
 file.managed:
  - source: salt://samba/smb.conf
  - template: jinja
  - mode: 644
  - user: root
  - group: root
  - watch_in:
      - service: smbd
      - service: nmbd

/etc/samba/smbpassw:
 file.managed:
  - mode: 644
  - user: root
  - group: root
  - replace: False

{%- for user, args in pillar['sambausers'].iteritems() %}

add-local-user-{{ user }}:
  cmd.run:
    - name: useradd --no-create-home --no-user-group --shell=/bin/false --home-dir=/nonexistent -c {{ user }} {{ args['login'] }}
    - unless: grep -q {{ args['login'] }} /etc/passwd

set-smb-pass-{{ user }}:
  cmd.run:
    - name: echo -e "{{ args['heslo'] }}\n{{ args['heslo'] }}" | smbpasswd -s -a {{ args['login'] }}
    - unless: pdbedit -L | grep {{ args['login'] }} -q
{% endfor %}

smbclient:
  pkg:
    - installed

cifs-utils:
  pkg:
    - installed
