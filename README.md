# yapi docker

Dockerized [yapi](https://github.com/YMFE/yapi) deployment.

## How does dockerized yapi work?

The docker image pre-defines a command to run yapi, but it's not enough since user account initialization involves Mongodb which must be finished before formally starting yapi server.

Henceforth an intermediate container should be started as a docker compose service and also as a job to serve such necessary initialization. The initialization job can be run multiple times but only succeeds in the first time due to duplicated data in Mongodb, it doesn't matter whether it succeeds or fails, but will eventually exit which is normal.

## How to run

Modify `config.json` that suits your needs, the deployment depends on it. To start the deployment, run:

```bash
make up
```

Then open `localhost:3000` at your browser, input default credentials to login, it's recommended that you change the default password.

The `nginx.conf` can be a good reference if you deploy yapi behind a reverse proxy.

## Data migration

All api data persists in Mongodb, and all MongoDB data is managed by Docker named volume as defined in `docker-compose.yml`. As long as you don't delete that volume, the data survives on every repeated deployment.

See [Backup, restore, or migrate data volumes](https://docs.docker.com/storage/volumes/#backup-restore-or-migrate-data-volumes) to know more about Docker volume migration.
