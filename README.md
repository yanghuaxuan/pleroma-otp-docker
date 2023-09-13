**OTP Release Pleroma, Containerized**
Inspired by [angristan/docker-pleroma](https://github.com/angristan/docker-pleroma)

## Features
- Based on a slightly modified version of [this guide](https://docs.pleroma.social/backend/installation/otp_en/#edit-the-nginx-config)
- Ran as an unprivileged user
- It works great (probably)

## Usage
**The image will need to be built by yourself.**
- `config.exs` runs into permission problems when bind mounted. Thus, the Dockerfile directly copies the file to solve this.

1. Modify `config.exs` accordingly
    - Hint, you can generate the database password using
      ```
      cat /dev/urandom | base64 | head -c 64
      ```
3. Build
```
docker compose build
# or
docker build -t pleroma .
```
3. Run
```
docker compose up -d
```
