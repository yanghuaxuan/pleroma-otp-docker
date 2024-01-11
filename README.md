**OTP Release Pleroma, Containerized**

Inspired by [angristan/docker-pleroma](https://github.com/angristan/docker-pleroma)

## Features
- Based on a slightly modified version of [this guide](https://docs.pleroma.social/backend/installation/otp_en/#edit-the-nginx-config)
- Ran as an unprivileged user
- It works great (probably)

## Usage
**The image will need to be built by yourself.**
- `config.exs` runs into permission problems when bind mounted. Thus, the Dockerfile directly copies the file to solve this.
1. Copy `config.exs.example` and `docker-compose.yml.example`
    ```
    cp config.exs.example config.exs
    cp docker-compose.yml.example docker-compose.yml
    ```
3. Modify `config.exs` and `docker-compose.yml` accordingly 
    - Hint, you can generate the database password using
      ```
      cat /dev/urandom | base64 | head -c 64
      ```
4. Build
    ```
    docker compose build
    # or
    docker build -t pleroma .
    ```
3. Run
    ```
    docker compose up -d
    ```

## Upgrading
```
docker build -t pleroma .
docker-compose run --rm web mix ecto.migrate # migrate the database if needed
docker-compose up -d # recreate the containers if needed
```
