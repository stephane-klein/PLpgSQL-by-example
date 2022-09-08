I would like to create something like https://gobyexample.com/ for PL/pgSQL.

This repository is in pre-alpha.

See also: [Docker-compose postgres helper scripts](https://github.com/stephane-klein/docker-compose-postgres-helper)

## Playground

Start the PostgreSQL Docker container:

```sh
$ docker compose up -d postgres --wait
```

Enter in Postgres (before you need to install [pgcli](https://www.pgcli.com/), for instance with `brew install pgcli`):

```
$ ./scripts/pgcli.sh
```

