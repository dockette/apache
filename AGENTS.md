# AGENTS.md

## Project

Dockette Apache builds `dockette/apache`, a ready-to-use Apache httpd image based on the legacy `dockette/jessie` Debian Jessie base image.

## Images

- Default image: `dockette/apache:latest`.
- Build context: repository root `.` with `Dockerfile`.
- Runtime document root: `/srv`.
- Exposed ports: `80` and `443`; the default command runs `apache2ctl -D FOREGROUND`.
- This image is legacy because it depends on Debian Jessie. Keep changes conservative and avoid promising modern Debian security support without updating the base image.

## Commands

- `make build` builds `${DOCKER_IMAGE}:${DOCKER_TAG}` from `.`.
- `make test` runs Apache version and configuration smoke checks against the built image.
- `make run` starts the image locally on `8080:80` with the current directory mounted to `/srv`.

## Testing Notes

- Prefer `make test` after Dockerfile or Apache configuration changes.
- Use `make -n build test run` to dry-run command wiring without requiring Docker.
- The smoke test requires Docker and a previously built `${DOCKER_IMAGE}:${DOCKER_TAG}` image.

## Guidelines

- Keep `Dockerfile`, `Makefile`, README, and `.github/workflows/docker.yml` aligned.
- Prefer `DOCKER_*` names for Docker-related Makefile variables.
- Place `.PHONY: <target>` directly above each Makefile target.
- Keep README badges and maintenance sections consistent with other Dockette image repos.
- Document legacy constraints when touching the Jessie base or Apache package behavior.
- Do not introduce unrelated formatting or structural changes.
