utils:
 - htop
 - curl
 - dtrx
 - cpanminus
 - resolvconf
 - apache2-utils
 - nload
 - iftop
 - tcpdump
 - nmap
 - sqlite3
 - links
 - gettext
 - libipc-system-simple-perl
 - libtemplate-perl
 - libxml-simple-perl
 - libintl-perl
 - apt-listchanges
 - libxml-perl
 - libxml-libxml-perl
 - colordiff
 - apt-transport-https
 - unp
 - zlib1g-dev
 - libdigest-md5-file-perl
 - libdigest-crc-perl
 - ethtool
 - libfile-slurper-perl

remove:
 - nano
 - vim-tiny
 - nfs-common
 - rpcbind
 - procmail
 - mutt

hostname: debian-router

ssh_port: 4321

phpbin: /usr/bin/php -c /etc/php/7.1/fpm/php.ini
phpsessiondir: /var/lib/php/sessions

sambausers:
  Petr:
    login: petr
    heslo: 5bXHUJGuvtrcdeh8C6Eaqgkm9

fpm_pools:
  www:
   port: 9000
  zabbix:
   port: 9002
  db:
   port: 9003

phpmyadmin:
  version: "4_7_4"
  md5: a874e2940a16be95a9e9b3eb38571e23
  maxupload: 50M

speedtest:
  maxupload: 50M

http_auth_users:
  db: 
   pass: e3aPx8Km6GXbtHqdwN7husD4R
  speed: 
   pass: CgxUfGEe5qN46vP9MpRnK7wbQ
  zabbix: 
   pass: T6hKRsDrBqjHEgxm29un4ab7C

nginx_confs:
 - debian-router.example.cz

mysql_root_password: EeAqfJ7MUCvF3s9jHQpNdwTVR

zabbix:
  mysqlpasswd: qdA6tNM5SRDaesQxhJC4pBEKF
  version: 3.4.1
