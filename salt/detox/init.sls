detox:
  pkg:
    - installed

/home/petr/.detoxrc:
 file.managed:
  - source: salt://detox/detoxrc
  - mode: 644
  - user: petr
  - group: users
