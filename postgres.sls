postgres:
  docker_image.present:
    - tag: 12

postgres_user:
  user.present:
    - uid: 999
    - name: postgres
    - shell: /usr/sbin/nologin

/data/postgres-data-dir/:
  file.directory:
    - mode: 755
    - user: postgres
    - group: root
    - makedirs: True

/data/postgres-wal-dir/:
  file.directory:
    - mode: 755
    - user: postgres
    - group: root
    - makedirs: True 

