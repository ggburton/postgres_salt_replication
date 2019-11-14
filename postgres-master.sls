master-postgres:
  docker_container.running:
    - image: postgres:12
    - port_bindings:
      - 5432:5432
    - binds:
      - /srv/postgres-data:/data/postgres-data-dir
      - /srv/postgres-wal-dir:/data/postgres-wal-dir
    - command: [
        "postgres",
        "-carchive_mode=on",
        "-cwal_level=replica",
        "-carchive_command=test ! -f /postgres-wal-dir/%f && cp %p /postgres-wal-dir/%f" 
    ]
    - environment:
        PGDATA: /data/postgres-data-dir


create_replication_user:
  cmd.run:
    - name: "docker exec -it postgres-master /bin/bash -c 'createuser -h localhost -U postgres -S -D -R -P --replication -e wal WITH PASSWORD "123!@#qweQWE"'"
    - failhard: True
