vim-nox:
  pkg:
    - installed

/home/petr/.vimrc:
 file.managed:
  - source: salt://vim/vimrc
  - mode: 644
  - user: petr
  - group: users

/root/.vimrc:
 file.managed:
  - source: salt://vim/vimrc
  - mode: 644
  - user: root
  - group: root

vim-dir-create:
  file.directory:
    - name: /home/petr/tmp
    - user: petr
    - group: users
    - mode: 0755

vim-rtmp-create:
  file.directory:
    - name: /root/tmp
    - user: root
    - group: root
    - mode: 0755
