/home/petr/.bashrc:
 file.managed:
  - source: salt://bashrc/bashrc
  - template: jinja
  - context:
      root: NO
  - mode: 644
  - user: petr
  - group: users

/home/petr/.bash_profile:
 file.managed:
  - source: salt://bashrc/bash_profile
  - mode: 644
  - user: petr
  - group: users

/root/.bashrc:
 file.managed:
  - source: salt://bashrc/bashrc
  - mode: 644
  - template: jinja
  - context:
      root: OK
  - user: root
  - group: root

/root/.profile:
 file.managed:
  - source: salt://bashrc/profile
  - mode: 644
  - user: root
  - group: root
