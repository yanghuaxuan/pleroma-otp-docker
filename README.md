**OTP Release Pleroma, Containerized**

## Features
- Based on a slightly modified version of [this guide](https://docs.pleroma.social/backend/installation/otp_en/#edit-the-nginx-config)
- Ran as an unprivileged user
- It works great (probably)

## Usage
**The image will need to be built by yourself.**
- `config.exs` runs into permission problems when bind mounted. Thus, the Dockerfile directly copies the file to solve this.

1. Modify `config.exs` accordingly
2. Build
```
docker compose build
# or
docker build -t pleroma .
```
3. Run
```
docker compose up -d
```
