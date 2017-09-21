saltstackrepo:
  pkgrepo.managed:
    - humanname: saltstack
    - name: deb http://repo.saltstack.com/apt/debian/9/amd64/latest stretch main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: salt://salt/saltstack.gpg

minion:
  pkg.installed:
    - name: salt-minion
  service.disabled:
    - name: salt-minion
    - enable: False

minion-stop:
  cmd.run:
    - name: /etc/init.d/salt-minion stop
    - unless: test ! -f /var/run/salt-minion.pid
    - cwd: /root/
