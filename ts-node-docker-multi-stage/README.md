Running in dev?

```
docker-compose up --build
```

This installs all the node modules and will hot reload due to the volumes attachment.

We're using ts-node so we don't have a dist/ or build/ folder when we're creating / running anything in dev mode.

Running in production?

We're using the docker-compose.prod.yml to overwrite the dev commands:

```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build
```

---

Downside to this is that if we're in prod mode then we need to have the dev dependencies as dependencies otherwise we can't build it properly when we're trying to go for production:

> E.g.

```
    "@types/express": "^4.17.13",
    "typescript": "^4.6.4",
```
