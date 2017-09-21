<?php
$cfg['blowfish_secret'] = 'HDgX6vwxEWbeFaVBMUk9PCN8jweuP94xC3RXJDj7gKSAThMfW2';
$i = 0;
$i++;

$cfg['Servers'][$i]['auth_type'] = 'cookie';
$cfg['Servers'][$i]['host'] = '127.0.0.1';
$cfg['Servers'][$i]['connect_type'] = 'tcp';
$cfg['Servers'][$i]['compress'] = false;
$cfg['Servers'][$i]['extension'] = 'mysqli';
$cfg['Servers'][$i]['AllowNoPassword'] = false;
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';
$cfg['VersionCheck'] = false;
$cfg['LoginCookieValidity'] = 7*24*3600;
$cfg['LoginCookieStore'] = 7*24*3600;
$cfg['MaxRows'] = 500;
$cfg['NavigationDisplayLogo'] = false;
$cfg['NavigationTreeEnableExpansion'] = false;
$cfg['SendErrorReports'] = 'never';
$cfg['PmaAbsoluteUri'] = 'https://{{ pillar.hostname }}.example.cz/db/';
