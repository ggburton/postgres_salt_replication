postgres:
  docker_image.present:
    - tag: 12

/data:
  file.managed:
    - mode: 644
    - user: '999'
    - group: '999'

test-postgres:
  docker_container.running:
    - image: postgres:12
    - port_bindings:
      - 5432:5432
    - binds:
      - /srv/postgres-data:/data/postgres-data-dir
      - /srv/postgres-wal-dir:/data/postgres-wal-dir
    - user: '999'
    - command: [
        "postgres",
        "-carchive_mode=on",
        "-cwal_level=replica",
        "-carchive_command=test ! -f /postgres-wal-dir/%f && cp %p /postgres-wal-dir/%f" 
    ]
    - environment:
        PGDATA: /data/postgres-data-dir