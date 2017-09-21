{% for user, args in pillar['http_auth_users'].iteritems() %}

nginx-http-auth-{{ user }}:
  cmd.run:
    - name: 'touch /etc/nginx/htpasswd.{{ user }}'
    - unless: 'file /etc/nginx/htpasswd.{{ user }} > /dev/null'


http-auth-{{ user }}:
  cmd.run:
    - name: 'htpasswd -s -c -b /etc/nginx/htpasswd.{{ user }} {{ user }} {{ args['pass'] }}'
    - unless: 'cat /etc/nginx/htpasswd.{{ user }} | grep "^`htpasswd -s -b -n {{ user }} {{ args['pass'] }} | head -1`" > /dev/null'
      
{% endfor %}
