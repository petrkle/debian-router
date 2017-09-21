/home/petr/.gitconfig:
 file.managed:
  - source: salt://git/gitconfig
  - mode: 644
  - user: petr
  - group: users

/usr/local/bin/diff-highlight:
 file.managed:
  - source: salt://git/diff-highlight
  - mode: 755
  - user: root
  - group: root
