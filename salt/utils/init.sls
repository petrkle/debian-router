{% for package in pillar.utils %}
{{package}}:
  pkg.installed:
    - name: {{package}}
{% endfor %}
