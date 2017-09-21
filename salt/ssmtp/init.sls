ssmtp:
  pkg:
    - installed

/etc/ssmtp/ssmtp.conf:
 file.managed:
  - source: salt://ssmtp/ssmtp.conf
  - template: jinja
  - mode: 640
  - user: root
  - group: mail

group-mail-petr:
  cmd.run:
    - name: usermod -a -G mail petr
    - unless: 'grep "^mail:" /etc/group | grep petr'
