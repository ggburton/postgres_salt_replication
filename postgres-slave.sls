master-postgres:
  docker_container.running:
    - image: postgres:12
    - port_bindings:
      - 5432:5432
    - binds:
      - /srv/postgres-data:/data/postgres-data-dir
      - /srv/postgres-wal-dir:/data/postgres-wal-dir
    - command: ["postgres"]
    - environment:
        PGDATA: /data/postgres-data-dir
