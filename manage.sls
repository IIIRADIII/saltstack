basepackages:
  pkg.installed:
    - pkgs:
      - iptables 
      - apt
      - ntp
      - htop
      - iotop
      - tcpdump
      - git
      - wget
      - vim
      - sysstat

saltuser:
  user.present:
    - shell: /bin/bash
    - home: /home/saltuser
    - groups:      
        - sudo

AAAAB3NzaC1yc2EAAAADAQABAAABAQDATgAExDCRgj/FgRfwd3jCYIAH04NoOaPP5Wfno97n1SP2YqanQiUQ8eHcTr6CfRhqA0pVsh57p7U0wZEqIoAqq9uLDRx4JFj2ksDvYw9hBK4ejcedjk5GTuUL61d2edClcUsgg+j1cSFeEe1qPPoHoaA8AkgjBAzGP+JDhEWPFrT6Ii22KT5BuZFm7kM1AtenD6eznKEHtCg9BpTSpIPlLLDuFeS7OBKo9aDMZ8bR7mcQmYRAH0yJS2JYdsJWaN2997UspJ1dtvvmTmCzg7w6K1c7TiLprf+Ccq+UiRiPSagsnFUIsIvR+3wyuSiB/f99D9UTkdHEcaTq4SI/i567:
  ssh_auth.present:
    - user: saltuser
    - enc: ssh-rsa

ssh:
  service.running:
    - watch:
      - file: /etc/ssh/ssh_config

/etc/ssh/ssh_config:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://ssh/ssh_config

/etc/motd:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://motd/motd
