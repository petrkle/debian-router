screen:
  pkg:
    - installed

/home/petr/.screenrc:
 file.managed:
  - source: salt://screen/screenrc
  - mode: 644
  - user: petr
  - group: users
