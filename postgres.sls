postgres:
  docker_image.present:
    - tag: 12

test-postgres:
  docker_container.running:
    - image: postgres:12
    - port_bindings:
      - 5432:5432
